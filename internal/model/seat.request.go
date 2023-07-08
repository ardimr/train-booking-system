package model

type AvailableSeatRequestParam struct {
	TravelId       int64  `form:"travel_id"`
	WagonClassCode string `form:"wagon_class"`
}
