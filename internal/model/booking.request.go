package model

type BookingRequestBody struct {
	TravelId         int64              `json:"travel_id" binding:"required"`
	ContactDetails   ContactDetails     `json:"contact_details" binding:"required"`
	PassengerDetails []PassengerDetails `json:"passenger_details" binding:"required"`
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
