package model

import "time"

type User struct {
	ID         int64     `json:"user_id,omitempty"`
	FullName   string    `json:"fullname"`
	Username   string    `json:"username,omitempty"`
	Password   string    `json:"password,omitempty"`
	Email      string    `json:"email"`
	Role       string    `json:"role,omitempty"`
	CreatedAt  time.Time `json:"created_at,omitempty"`
	UpdatedAt  time.Time `json:"updated_at,omitempty"`
	IsVerified bool      `json:"is_verified,omitempty"`
}

type UserInfo struct {
	ID          int64    `json:"UserID,omitempty"`
	FullName    string   `json:"FullName"`
	Username    string   `json:"Username"`
	Password    string   `json:"password"`
	Email       string   `json:"email"`
	Role        string   `json:"role"`
	Permissions []string `json:"permissions"`
}

type UserRole struct {
	ID       int64  `json:"id,omitempty"`
	Username string `json:"username"`
	RoleID   int64  `json:"role_id"`
}

type GetUserByIdReqUri struct {
	ID int64 `uri:"id"`
}

type AddNewUserReqBody struct {
	Name string `json:"name"`
}

type DeleteUserReqUri struct {
	ID int64 `uri:"id"`
}

type NewUser struct {
	FullName    string `json:"fullName" binding:"required"`
	Username    string `json:"username" binding:"required"`
	Password    string `json:"password" binding:"required"`
	Email       string `json:"email" binding:"required,email"`
	PhoneNumber string `json:"phone_number"`
	IDtype      int64  `json:"id_type"`
	IDNumber    string `json:"id_number"`
	IsVerified  bool   `json:"is_verified"`
}
