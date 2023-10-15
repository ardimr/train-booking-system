package usecase

import (
	"context"

	"github.com/ardimr/train-booking-system/internal/ticket/model"
	"github.com/ardimr/train-booking-system/internal/ticket/repository"
)

type ITicketUseCase interface {
	GetUserTickets(ctx context.Context, userId int64) ([]model.UserTicket, error)
	GetTicketDetailsById(ctx context.Context, param model.TicketRequestUri) (model.TicketDetails, error)
}
type TicketUseCase struct {
	ticketRepo repository.ITicketRepository
}

func NewTicketUseCase(ticketRepo repository.ITicketRepository) *TicketUseCase {
	return &TicketUseCase{
		ticketRepo: ticketRepo,
	}
}

func (uc *TicketUseCase) GetUserTickets(ctx context.Context, userId int64) ([]model.UserTicket, error) {
	// Get user tickets from repository
	userTickets, err := uc.ticketRepo.GetUserTickets(ctx, userId)

	if err != nil {
		return nil, err
	}

	return userTickets, nil
}

func (uc *TicketUseCase) GetTicketDetailsById(ctx context.Context, param model.TicketRequestUri) (model.TicketDetails, error) {
	// Get user ticket from repository, filtered by user id
	var ticketDetails model.TicketDetails
	ticketDetails, err := uc.ticketRepo.GetTicketDetailsById(ctx, param.TicketId)

	if err != nil {
		return ticketDetails, err
	}

	return ticketDetails, nil
}
