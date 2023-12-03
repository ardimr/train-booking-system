package model

type Wagon struct {
	ClassId     int64 `json:"class_id"`
	Capacity    int64 `json:"capacity"`
	WagonNumber int64 `json:"wagon_number"`
}

type Train struct {
	Code   string  `json:"code"`
	Name   string  `json:"name"`
	Wagons []Wagon `jon:"wagons"`
}
