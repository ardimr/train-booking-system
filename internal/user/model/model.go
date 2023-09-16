package model

import "time"

type UserIdentity struct {
	IdentityType   string `json:"id_type"`
	IdentityNumber string `json:"id_number"`
}

type UserBalance struct {
	Currency string `json:"currency"`
	Amount   int64  `json:"amount"`
}
type UserDetails struct {
	UserId      int64        `json:"user_id,omitempty"`
	Username    string       `json:"username"`
	Email       string       `json:"email"`
	Fullname    string       `json:"fullname"`
	PhoneNumber string       `json:"phone_number"`
	Identity    UserIdentity `json:"identity"`
	BornDate    time.Time    `json:"born_date"`
	Balance     UserBalance  `json:"user_balance"`
}

type PhoneNumber struct {
	CountryCode string `json:"country_code"`
	Number      string `json:"number"`
}

type Identity struct {
	Type   string `json:"type"`
	Number string `json:"number"`
}

type UserRequestUri struct {
	UserId   int64  `uri:"user_id,omitempty"`
	Username string `uri:"username,omitempty"`
}
type NewUserRequestBody struct {
	FullName    string      `json:"full_name" binding:"required"`
	Username    string      `json:"username" binding:"required"`
	Password    string      `json:"password" binding:"required"`
	Email       string      `json:"email" binding:"required,email"`
	PhoneNumber PhoneNumber `json:"phone_number" binding:"required"`
	IdType      string      `json:"id_type" binding:"required"`
	IdNumber    string      `json:"id_number" binding:"required"`
	BornDate    string      `json:"born_date" binding:"required"`
}
