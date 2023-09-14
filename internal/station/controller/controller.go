package controller

import "github.com/ardimr/train-booking-system/internal/station/repository"

type StationController struct {
	querier repository.IStationRepository
}

func NewStationController(q repository.IStationRepository) *StationController {
	return &StationController{
		querier: q,
	}
}
