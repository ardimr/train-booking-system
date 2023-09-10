package model

import "time"

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

type GetTravelByIdReqUri struct {
	TravelId int64 `uri:"id"`
}

type GetTravelByIdParam struct {
	WagonClass string `form:"wagon_class"`
}
