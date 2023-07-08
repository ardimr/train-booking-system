package model

import "time"

type User struct {
	ID   int64  `json:"id,omitempty"`
	Name string `json:"name,omitempty"`
}

type Travel struct {
	TravelID           int64     `json:"travel_id,omitempty"`
	TravelCode         int64     `json:"travel_code"`
	DepartureStation   Station   `json:"departure_station"`
	DestinationStation Station   `json:"destination_station"`
	DepartureSchedule  time.Time `json:"departure_schedule"`
	ArrivalSchedule    time.Time `json:"arrival_schedule"`
	TrainCode          string    `json:"train_code"`
}

type TravelSchedule struct {
	TravelID           int64      `json:"travel_id,omitempty"`
	TravelCode         int64      `json:"travel_code"`
	TrainCode          string     `json:"train_code"`
	TrainName          string     `json:"train_name"`
	WagonClass         WagonClass `json:"wagon_class"`
	DepartureStation   Station    `json:"departure_station"`
	DestinationStation Station    `json:"destination_station"`
	DepartureSchedule  time.Time  `json:"departure_schedule"`
	ArrivalSchedule    time.Time  `json:"arrival_schedule"`
	Duration           Duration   `json:"duration"`
	Cost               Cost       `json:"cost"`
	AvailableSeats     int        `json:"available_seats"`
}

type WagonClass struct {
	Code string `json:"wagon_class_code"`
	Name string `json:"wagon_class_name"`
}

type Duration struct {
	Hour   int `json:"duration_hour"`
	Minute int `json:"duration_minute"`
}

type Cost struct {
	Currency string `json:"currency"`
	Amount   int    `json:"amount"`
}
