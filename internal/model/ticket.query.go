package model

import "time"

type TicketDetails struct {
	TicketId           int64             `json:"ticket_id"`
	Status             string            `json:"status"`
	DepartureStation   Station           `json:"departure_station"`
	DestinationStation Station           `json:"destination_station"`
	DepartureSchedule  time.Time         `json:"departure_schedule"`
	ArrivalSchedule    time.Time         `json:"arrival_schedule"`
	Duration           Duration          `json:"duration"`
	Passengers         []TicketPassenger `json:"passengers"`
}

type TicketPassenger struct {
	PassengerId       int64  `json:"passenger_id"`
	PassengerName     string `json:"passenger_name"`
	PassengerIdType   string `json:"passenger_id_type"`
	PassengerIdNumber string `json:"passenger_id_number"`
	SeatId            int64  `json:"seat_id"`
	SeatLabel         string `json:"seat_label"`
}

type UserTicket struct {
	UserId             int64     `json:"user_id"`
	TicketId           int64     `json:"ticket_id"`
	TravelCode         string    `json:"travel_code"`
	DepartureStation   Station   `json:"departure_station"`
	DestinationStation Station   `json:"destination_station"`
	DepartureSchedule  time.Time `json:"departure_schedule"`
	ArrivalSchedule    time.Time `json:"arrival_schedule"`
	Duration           Duration  `json:"duration"`
}