package usecase

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"time"

	"github.com/ardimr/train-booking-system/internal/booking/model"
	"github.com/ardimr/train-booking-system/internal/booking/repository"
	"github.com/ardimr/train-booking-system/internal/helpers"
)

type IBookingUseCase interface {
	NewBooking(ctx context.Context, userId int64, newBooking model.BookingRequestBody) (model.BookingDetails, error)
	GetBookingDetails(ctx context.Context, travelId int64, bookingCode string) (model.BookingDetails, error)
	PayBooking(ctx context.Context, travelID int64, bookingCode string) error
}

type BookingUseCase struct {
	bookingRepo      repository.IBookingRepository
	bookingRedisRepo repository.IBookingRedisRepository
}

func NewBookingUseCase(bookingRepo repository.IBookingRepository, bookingRedisRepo repository.IBookingRedisRepository) *BookingUseCase {
	return &BookingUseCase{
		bookingRepo:      bookingRepo,
		bookingRedisRepo: bookingRedisRepo,
	}
}

func (uc *BookingUseCase) NewBooking(ctx context.Context, userId int64, newBooking model.BookingRequestBody) (model.BookingDetails, error) {
	// Generate booking code
	var bookingDetails model.BookingDetails
	bookingDetails.UserId = userId
	bookingDetails.BookingCode = helpers.GenerateBookingCode()
	bookingDetails.TravelId = newBooking.TravelId
	bookingDetails.ContactDetails = newBooking.ContactDetails
	bookingDetails.PassengerDetails = newBooking.PassengerDetails

	const ttl = time.Duration(1) * time.Hour // 1 hour

	// Set key
	var bookingKey string

	// If booking code is already exists in the redis or database, then regenerate the new booking code
	isAlreadyExists := true
	for isAlreadyExists {
		// Set key and check in database
		bookingKey = fmt.Sprintf("booking.%d.%s", bookingDetails.TravelId, bookingDetails.BookingCode)
		countKeys, err := uc.bookingRedisRepo.CheckKey(ctx, bookingKey)

		if err != nil {
			return bookingDetails, err
		}

		if countKeys == 0 {
			isAlreadyExists = false
			break
		} else {
			bookingDetails.BookingCode = helpers.GenerateBookingCode()
		}
	}

	// Set booking deadline/ttl in redis cache
	bookingDetails.Deadline = time.Now().Add(ttl)

	// Serialize to json
	bookingJson, err := json.Marshal(bookingDetails)

	if err != nil {
		return bookingDetails, err
	}

	// Check the seats availability to prevent the double booking
	seatKeys := []string{}
	for _, passenger := range bookingDetails.PassengerDetails {
		seatKey := fmt.Sprintf("seat.%d.%d", bookingDetails.TravelId, passenger.SeatId)
		countSeats, err := uc.bookingRedisRepo.CheckKey(ctx, seatKey)

		if err != nil {
			return bookingDetails, err
		}

		// Cancel booking when the selected seat is not available
		if countSeats > 0 {
			return bookingDetails, errors.New("selected seat is not available")
		}

		seatKeys = append(seatKeys, seatKey)
	}

	// Set the seatkey into the redis cache
	err = uc.bookingRedisRepo.LockSeats(ctx, seatKeys, ttl)

	if err != nil {
		return bookingDetails, err
	}

	// Set The booking Key
	err = uc.bookingRedisRepo.SetBooking(
		ctx,
		bookingKey,
		bookingJson,
		ttl,
	)

	if err != nil {
		return bookingDetails, err
	}

	// Write to repository
	err = uc.bookingRepo.CreateBooking(ctx, bookingDetails)
	if err != nil {
		return bookingDetails, err
	}

	return bookingDetails, nil
}

func (uc *BookingUseCase) GetBookingDetails(ctx context.Context, travelId int64, bookingCode string) (model.BookingDetails, error) {
	var bookingDetails model.BookingDetails

	bookingDetails, err := uc.bookingRedisRepo.GetBooking(ctx, travelId, bookingCode)

	if err != nil {
		return bookingDetails, err
	}

	return bookingDetails, nil
}

func (uc *BookingUseCase) PayBooking(ctx context.Context, travelID int64, bookingCode string) error {
	var bookingDetails model.BookingDetails

	bookingDetails, err := uc.bookingRedisRepo.GetBooking(ctx, travelID, bookingCode)
	if err != nil {
		return err
	}

	// Update booking status in database
	err = uc.bookingRepo.UpdateBookingStatus(ctx, bookingCode)
	if err != nil {
		return err
	}

	fmt.Println(bookingDetails)
	return nil
}
