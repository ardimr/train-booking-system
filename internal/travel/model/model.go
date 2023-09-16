package model

import "time"

type User struct {
	ID   int64  `json:"id,omitempty"`
	Name string `json:"name,omitempty"`
}

type Travel struct {
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
	Fare               Cost       `json:"fare"`
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
	Hour   int `json:"hour"`
	Minute int `json:"minute"`
}

type Cost struct {
	Currency string `json:"currency"`
	Amount   int    `json:"amount"`
}

type Station struct {
	Code     string `json:"code"`
	Name     string `json:"name"`
	CityCode string `json:"city_code"`
}

// Requests
type TravelScheduleReqParam struct {
	// DepartureCityCode      string `form:"departure_city_code,omitempty"`
	// DestinationCityCode    string `form:"destination_city_code,omitempty"`
	DepartureStationCode   string `form:"departure_station_code"`
	DestinationStationCode string `form:"destination_station_code"`
	DepartureDate          string `form:"departure_date"`
}

type AddNewTravelFare struct {
	ClassId  int64  `json:"class_id"`
	Amount   int64  `json:"amount"`
	Currency string `json:"currency"`
}
type AddNewTravel struct {
	TravelCode         int64              `json:"travel_code"`
	DepartureStation   Station            `json:"departure_station"`
	DestinationStation Station            `json:"destination_station"`
	DepartureSchedule  time.Time          `json:"departure_schedule"`
	ArrivalSchedule    time.Time          `json:"arrival_schedule"`
	TrainCode          string             `json:"train_code"`
	Fares              []AddNewTravelFare `json:"fares"`
}

type TravelReqUri struct {
	TravelId int64 `uri:"id"`
}

type TravelReqParam struct {
	WagonClass string `form:"wagon_class"`
}
