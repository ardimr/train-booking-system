package controller

import (
	"github.com/ardimr/train-booking-system/internal/booking/repository"
)

type BookingController struct {
	querier repository.IBookingRepository
	redis   repository.IBookingRedisRepository
}

func NewBookingController(q repository.IBookingRepository, r repository.IBookingRedisRepository) *BookingController {
	return &BookingController{
		querier: q,
		redis:   r,
	}
}
