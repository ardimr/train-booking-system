package repository

import (
	"context"
	"encoding/json"

	"github.com/ardimr/train-booking-system/configs/db"
	"github.com/ardimr/train-booking-system/internal/user/model"
)

type IUserRepository interface {
	GetUserDetails(ctx context.Context, userId int64) (model.UserDetails, error)
}

type UserRepository struct {
	db db.DBInterface
}

func NewUserRepository(db db.DBInterface) *UserRepository {
	return &UserRepository{
		db: db,
	}
}

func (q *UserRepository) GetUserDetails(ctx context.Context, userId int64) (model.UserDetails, error) {
	var userDetails model.UserDetails

	var identityRaw []byte
	var balanceRaw []byte

	queryStatement := `
	SELECT
    users.user_id,
    users.username,
    users.email,
    users.fullname,
    users.phone_number,
		users.born_date,
    json_build_object(
    	'id_type',
    	id_types.name,
    	'id_number',
    	users.id_number
    ) AS identity,
    json_build_object(
    	'currency',
    	currencies.currency_code,
    	'amount',
    	user_account.balance    	
    ) AS balance
	FROM
			users.users
			INNER JOIN accounts.user_account on user_account.owner = users.user_id
			INNER JOIN users.id_types on id_types.id_type_id = users.id_type
			INNER JOIN finances.currencies on currencies.currency_code = user_account.currency_code
	WHERE

			users.user_id = $1
	`
	err := q.db.QueryRowContext(ctx, queryStatement, userId).Scan(
		&userDetails.UserId,
		&userDetails.Username,
		&userDetails.Email,
		&userDetails.Fullname,
		&userDetails.PhoneNumber,
		&userDetails.BornDate,
		&identityRaw,
		&balanceRaw,
	)

	if err != nil {
		return userDetails, err
	}

	// Unmarshaling
	if err := json.Unmarshal(identityRaw, &userDetails.Identity); err != nil {
		return userDetails, err
	}

	if err := json.Unmarshal(balanceRaw, &userDetails.Balance); err != nil {
		return userDetails, err
	}

	return userDetails, nil

}
