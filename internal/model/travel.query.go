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
	TravelID           int64     `json:"travel_id,omitempty"`
	TravelCode         int64     `json:"travel_code"`
	TrainCode          string    `json:"train_code"`
	TrainName          string    `json:"train_name"`
	TrainClass         string    `json:"train_class"`
	DepartureStation   string    `json:"departure_station"`
	DestinationStation string    `json:"destination_station"`
	DepartureSchedule  time.Time `json:"departure_schedule"`
	ArrivalSchedule    time.Time `json:"arrival_schedule"`
	Duration           string    `json:"duration"`
	Cost               int       `json:"cost"`
}
