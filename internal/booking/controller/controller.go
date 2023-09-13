package controller

import (
	"github.com/ardimr/train-booking-system/internal/booking/repository"
)

type Controller struct {
	querier repository.IBookingRepository
	redis   repository.IBookingRedisRepository
}

func NewController(q repository.IBookingRepository, r repository.IBookingRedisRepository) *Controller {
	return &Controller{
		querier: q,
		redis:   r,
	}
}
