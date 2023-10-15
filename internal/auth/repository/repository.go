package repository

import (
	"context"
	"database/sql"
	"encoding/json"

	"github.com/ardimr/train-booking-system/configs/db"
	"github.com/ardimr/train-booking-system/internal/auth/model"
)

type IAuthRepository interface {
	GetUsers(ctx context.Context) ([]model.User, error)
	GetUserById(ctx context.Context, id int64) (*model.User, error)
	AddNewUser(ctx context.Context, newUser model.NewUser) (int64, error)
	AddUserRole(ctx context.Context, userRole model.UserRole) (int64, error)
	UpdateUser(ctx context.Context, user model.User) (int64, error)
	DeleteUser(ctx context.Context, id int64) error
	GetUserPasswordByUsername(ctx context.Context, username string) (string, error)
	GetUserByUsername(ctx context.Context, username string) (*model.User, error)
	GetUserInfoByUsername(ctx context.Context, username string) (*model.UserInfo, error)
	GetRolePermissions(ctx context.Context) ([]model.RolePermission, error)
	GetRolePermissionsByUsername(ctx context.Context, username string) (model.RolePermission, error)
}

type AuthRepository struct {
	db db.DBInterface
}

func NewPostgresQuerier(db db.DBInterface) *AuthRepository {
	return &AuthRepository{
		db: db,
	}
}

// Query Implementation
func (q *AuthRepository) GetUserPasswordByUsername(ctx context.Context, username string) (string, error) {
	var password string

	queryStatement := `
	SELECT
		password
	FROM public.users
	WHERE username=$1
	`

	err := q.db.QueryRowContext(ctx, queryStatement, username).Scan(&password)

	if err != nil {
		return "", err
	}

	return password, nil

}

func (q *AuthRepository) GetUserByUsername(ctx context.Context, username string) (*model.User, error) {
	var user model.User

	queryStatement := `
	SELECT
		username,
		password,
		name,
		email,
		role
	FROM public.users
	WHERE username=$1
	`
	err := q.db.QueryRowContext(ctx, queryStatement, username).Scan(
		&user.Username,
		&user.Password,
		&user.FullName,
		&user.Email,
		&user.Role,
	)

	if err != nil {
		return nil, err
	}

	return &user, nil
}

func (q *AuthRepository) GetUserInfoByUsername(ctx context.Context, username string) (*model.UserInfo, error) {
	var user model.UserInfo

	tx, err := q.db.BeginTx(ctx, &sql.TxOptions{Isolation: sql.LevelDefault})

	if err != nil {
		return nil, err
	}

	queryStatement := `
	SELECT
		user_id,
		username,
		fullname,
		password,
		email
	FROM "users"."users"
	WHERE username=$1
	`
	err = tx.QueryRowContext(ctx, queryStatement, username).Scan(
		&user.ID,
		&user.Username,
		&user.FullName,
		&user.Password,
		&user.Email,
	)

	if err != nil {
		tx.Rollback()
		return nil, err
	}

	queryStatement = `
	SELECT
		roles.name
	FROM "users"."users"
	INNER JOIN users.user_roles
	ON users.user_id = user_roles.user_id
	INNER JOIN users.roles
	ON user_roles.role_id = roles.id
	WHERE "users".user_id=$1
	`
	err = tx.QueryRowContext(ctx, queryStatement, user.ID).Scan(
		&user.Role,
	)

	if err != nil {
		tx.Rollback()
		return nil, err
	}

	// queryStatement = `
	// SELECT
	// 	permissions.action
	// FROM "users"
	// INNER JOIN user_roles
	// ON users.user_id = user_roles.user_id
	// INNER JOIN role_permissions
	// ON user_roles.role_id = role_permissions.role_id
	// INNER JOIN permissions
	// ON role_permissions.permission_id = permissions.id
	// WHERE users.user_id=$1
	// `
	// rows, err := tx.QueryContext(ctx, queryStatement, user.ID)

	// if err != nil {
	// 	tx.Rollback()
	// 	return nil, err
	// }

	// for rows.Next() {
	// 	var permission string
	// 	err := rows.Scan(&permission)

	// 	if err != nil {
	// 		tx.Rollback()
	// 		return nil, err
	// 	}

	// 	user.Permissions = append(user.Permissions, permission)
	// }

	tx.Commit()
	return &user, nil
}

func (q *AuthRepository) GetUsers(ctx context.Context) ([]model.User, error) {
	var users []model.User

	sqlStatement := `
	SELECT 
		id,
		username,
		name,
		email,
		created_at,
		updated_at
	FROM public.users
	`

	// Querying
	rows, err := q.db.QueryContext(ctx, sqlStatement)

	if err != nil {
		return nil, err
	}

	for rows.Next() {
		var user model.User

		// read data
		err := rows.Scan(
			&user.ID,
			&user.Username,
			&user.FullName,
			&user.Email,
			&user.CreatedAt,
			&user.UpdatedAt,
		)
		if err != nil {
			return nil, err
		}

		users = append(users, user)
	}

	return users, nil
}

func (q *AuthRepository) GetUserById(ctx context.Context, id int64) (*model.User, error) {
	var user model.User

	queryStatement := `
	SELECT
		*
	FROM public.users
	WHERE id=$1
	`
	err := q.db.QueryRowContext(ctx, queryStatement, id).Scan(
		&user.ID,
		&user.FullName,
	)

	if err != nil {
		return nil, sql.ErrNoRows
	}

	return &user, nil
}

func (q *AuthRepository) AddNewUser(ctx context.Context, newUser model.NewUser) (int64, error) {

	var newId int64

	sqlStatement := `
	INSERT INTO public.users 
		(name, username, password, email) VALUES ($1,$2,$3,$4) RETURNING id
	`

	err := q.db.QueryRowContext(ctx,
		sqlStatement,
		newUser.Name,
		newUser.Username,
		newUser.Password,
		newUser.Email).Scan(&newId)

	if err != nil {
		return 0, err
	}

	return newId, nil
}

func (q *AuthRepository) AddUserRole(ctx context.Context, userRole model.UserRole) (int64, error) {
	var newId int64

	sqlStatement := `
	INSERT INTO user_roles
	(username, role_id)
	VALUES ($1,$2)
	RETURNING id
	`

	err := q.db.QueryRowContext(ctx, sqlStatement, userRole.Username, userRole.RoleID).Scan(&newId)

	if err != nil {
		return 0, err
	}

	return newId, nil
}

func (q *AuthRepository) UpdateUser(ctx context.Context, user model.User) (int64, error) {

	sqlStatement := `
	UPDATE public.users SET name=$2 WHERE id=$1
	`

	res, err := q.db.ExecContext(ctx, sqlStatement, user.ID, user.FullName)

	if err != nil {
		return 0, err
	}

	rowsAffeced, err := res.RowsAffected()

	if err != nil {
		return 0, err
	}
	return rowsAffeced, nil
}

func (q *AuthRepository) DeleteUser(ctx context.Context, id int64) error {

	// create sql statement to delete user from database
	sqlStatement := `DELETE FROM public.users WHERE id=$1`

	// execute sql statement
	res, err := q.db.ExecContext(ctx, sqlStatement, id)

	if err != nil {
		return err
	}

	rowsAffected, _ := res.RowsAffected()

	if rowsAffected < 1 {
		return sql.ErrNoRows
	}
	return nil
}

func (q *AuthRepository) GetRolePermissions(ctx context.Context) ([]model.RolePermission, error) {
	var rolePermissions []model.RolePermission

	queryStatement := `
	WITH role_resource_permission as (
		SELECT
			roles.name AS role_name,
			resources.name AS resource_name,
			array_agg(permissions.action) AS actions
		FROM role_resource_permissions
		INNER JOIN roles on roles.id = role_resource_permissions.role_id
		INNER JOIN resources on resources.id = role_resource_permissions.resource_id
		INNER JOIN permissions on permissions.id = role_resource_permissions.permission_id
		GROUP BY role_name, resource_name
	
		
	)
	
	SELECT
		role_name,
		json_agg(json_build_object('resource', resource_name, 'actions', actions)) AS permissions
	FROM role_resource_permission
	GROUP BY role_name	
	`

	rows, err := q.db.QueryContext(ctx, queryStatement)

	if err != nil {
		return nil, err
	}

	for rows.Next() {
		var rawRolePermission model.RawRolePermission
		var rolePermission model.RolePermission
		err = rows.Scan(
			&rawRolePermission.RoleName,
			&rawRolePermission.Permissions,
		)
		if err != nil {
			return nil, err
		}

		rolePermission.RoleName = rawRolePermission.RoleName
		// Unmarshal array of bytes into resource permission model
		err = json.Unmarshal(rawRolePermission.Permissions, &rolePermission.Permissions)

		if err != nil {
			return nil, err
		}

		rolePermissions = append(rolePermissions, rolePermission)
	}

	return rolePermissions, nil

}

func (q *AuthRepository) GetRolePermissionsByUsername(ctx context.Context, username string) (model.RolePermission, error) {

	queryStatement := `
	WITH role_resource_permission as (
		SELECT
			roles.name AS role_name,
			resources.name AS resource_name,
			array_agg(permissions.action) AS actions
		FROM role_resource_permissions
		INNER JOIN roles on roles.id = role_resource_permissions.role_id
		INNER JOIN resources on resources.id = role_resource_permissions.resource_id
		INNER JOIN permissions on permissions.id = role_resource_permissions.permission_id
		INNER JOIN user_roles on user_roles.role_id = roles.id
		WHERE user_roles.username = $1
		GROUP BY role_name, resource_name
	)
	
	SELECT
		role_name,
		json_agg(json_build_object('resource', resource_name, 'actions', actions)) AS permissions
	FROM role_resource_permission
	GROUP BY role_name	
	`
	var rawRolePermission model.RawRolePermission
	var rolePermission model.RolePermission
	err := q.db.QueryRowContext(ctx, queryStatement, username).Scan(
		&rawRolePermission.RoleName,
		&rawRolePermission.Permissions,
	)

	if err != nil {
		return rolePermission, err
	}

	rolePermission.RoleName = rawRolePermission.RoleName
	// Unmarshal array of bytes into resource permission model
	err = json.Unmarshal(rawRolePermission.Permissions, &rolePermission.Permissions)

	if err != nil {
		return rolePermission, err
	}

	return rolePermission, nil

}

// func (q *AuthRepository) GetRolePermissions(ctx context.Context) ([]model.RolePermission, error) {
// 	var rolePermissions []model.RolePermission

// 	tx, err := q.db.BeginTx(ctx, &sql.TxOptions{Isolation: sql.LevelDefault})

// 	if err != nil {
// 		return nil, err
// 	}

// 	// Get Roles
// 	var roles []model.Role
// 	queryStatement := `
// 	SELECT
// 		id,
// 		name,
// 	FROM roles
// 	`

// 	rows, err := tx.QueryContext(ctx, queryStatement)

// 	if err != nil {
// 		return nil, err
// 	}

// 	for rows.Next() {
// 		var role model.Role
// 		err := rows.Scan(&role.ID, &role.Name)

// 		if err != nil {
// 			return nil, err
// 		}

// 		roles = append(roles, role)
// 	}

// 	// Get Resources
// 	queryStatement = `
// 	SELECT
// 		resources.id as resource_id,
// 		resources.name as resource_name
// 	FROM roles
// 	INNER JOIN role_resources
// 	ON roles.id = role_resources.role_id
// 	INNER JOIN resources
// 	ON role_resources.resource_id=resources.id
// 	WHERE roles.id=$1
// 	`
// 	stmt, err := tx.PrepareContext(ctx, queryStatement)

// 	if err != nil {
// 		return nil, err
// 	}

// 	// Loop for each role
// 	for _, role := range roles {

// 		stmt.QueryContext(ctx, role.ID)
// 	}

// }
