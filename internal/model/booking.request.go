package model

type BookingRequestBody struct {
	TravelId         int64              `json:"travel_id" binding:"required"`
	ContactDetails   ContactDetails     `json:"contact_details" binding:"required"`
	PassengerDetails []PassengerDetails `json:"passenger_details" binding:"required"`
}
