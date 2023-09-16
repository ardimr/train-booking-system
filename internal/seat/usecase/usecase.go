package usecase

import (
	"context"
	"errors"

	"github.com/ardimr/train-booking-system/internal/seat/model"
	"github.com/ardimr/train-booking-system/internal/seat/repository"
)

type ISeatUseCase interface {
	FindAvailableSeats(ctx context.Context, param model.AvailableSeatRequestParam) ([]model.AvailableSeat, error)
}

type SeatUseCase struct {
	seatRepo      repository.ISeatRepository
	seatRedisRepo repository.ISeatRedisRepository
}

func NewSeatUseCase(seatRepo repository.ISeatRepository, seatRedisRepo repository.ISeatRedisRepository) *SeatUseCase {
	return &SeatUseCase{
		seatRepo:      seatRepo,
		seatRedisRepo: seatRedisRepo,
	}
}

func (uc *SeatUseCase) FindAvailableSeats(ctx context.Context, param model.AvailableSeatRequestParam) ([]model.AvailableSeat, error) {
	availableSeats, err := uc.seatRepo.FindAvailableSeats(ctx, param)

	if err != nil {
		return nil, err
	}

	if len(availableSeats) == 0 {
		return nil, errors.New("no available seat")
	}

	// Check in redis for any existing booked seats
	bookedSeats, err := uc.seatRedisRepo.GetBookedSeats(ctx, param.TravelId)
	if err != nil {
		return nil, err
	}

	for _, bookedSeat := range bookedSeats {
		// Overide the avaiability status
		for wagonIdx, wagon := range availableSeats {
			for rowIdx, row := range wagon.SeatingRows {
				for seatIdx, seat := range row.RowElements {
					if bookedSeat == seat.SeatId {
						availableSeats[wagonIdx].SeatingRows[rowIdx].RowElements[seatIdx].Available = false
					}
				}
			}
		}
	}

	return availableSeats, nil
}
