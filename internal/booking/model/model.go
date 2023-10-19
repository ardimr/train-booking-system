package model

import "time"

type BookingDetails struct {
	BookingCode      string             `json:"booking_code"`
	TravelId         int64              `json:"travel_id" binding:"required"`
	ContactDetails   ContactDetails     `json:"contact_details" binding:"required"`
	PassengerDetails []PassengerDetails `json:"passenger_details" binding:"required"`
	Deadline         time.Time          `json:"deadline"`
}

type PhoneNumber struct {
	CountryCode string `json:"country_code"`
	Number      string `json:"number"`
}

type ContactDetails struct {
	FullName    string      `json:"full_name"`
	PhoneNumber PhoneNumber `json:"phone_number"`
	Email       string      `json:"email" binding:"required,email"`
}

type PassengerDetails struct {
	PassengerName     string `json:"passenger_name" binding:"required"`
	PassengerIdType   string `json:"passenger_id_type" binding:"required"`
	PassengerIdNumber string `json:"passenger_id_number" binding:"required"`
	SeatId            int64  `json:"seat_id" binding:"required"`
}

type BookingRequestBody struct {
	TravelId         int64              `json:"travel_id" binding:"required"`
	ContactDetails   ContactDetails     `json:"contact_details" binding:"required"`
	PassengerDetails []PassengerDetails `json:"passenger_details" binding:"required"`
}

type BookingRequestUri struct {
	BookingCode string `uri:"booking_code"`
}

type BookingRequestParam struct {
	TravelId int64 `form:"travel_id"`
}

type PayBookingRequestParam struct {
	TravelID    int64  `form:"travel_id"`
	BookingCode string `form:"booking_code"`
}
