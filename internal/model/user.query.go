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
