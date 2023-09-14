package controller

import "github.com/ardimr/train-booking-system/internal/booking/repository"

type TicketController struct {
	querier repository.IBookingRepository
}

func NewBookingController(q repository.IBookingRepository) *TicketController {
	return &TicketController{
		querier: q,
	}
}
