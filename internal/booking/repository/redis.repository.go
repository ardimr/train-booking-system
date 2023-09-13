package repository

import (
	"context"
	"encoding/json"
	"fmt"
	"time"

	"github.com/ardimr/train-booking-system/internal/helpers"
	"github.com/ardimr/train-booking-system/internal/model"
	"github.com/redis/go-redis/v9"
)

type IBookingRedisRepository interface {
	CreateBooking(ctx context.Context, booking model.BookingRequestBody) (model.BookingDetails, error)
	GetBookedSeats(ctx context.Context, travelId int64) ([]int64, error)
	GetBooking(ctx context.Context, travelId int64, bookingCode string) (model.BookingDetails, error)
}

type BookingRedisRepository struct {
	redisClient *redis.Client
}

func NewRedisRepository(redisClient *redis.Client) *BookingRedisRepository {
	return &BookingRedisRepository{
		redisClient: redisClient,
	}
}

// Redis implementation
func (r *BookingRedisRepository) CreateBooking(ctx context.Context, booking model.BookingRequestBody) (model.BookingDetails, error) {

	// Generate booking code
	var bookingDetails model.BookingDetails
	bookingDetails.BookingCode = helpers.GenerateBookingCode()
	bookingDetails.TravelId = booking.TravelId
	bookingDetails.ContactDetails = booking.ContactDetails
	bookingDetails.PassengerDetails = booking.PassengerDetails

	// Set key in redis
	bookingKey := fmt.Sprintf("booking.%d.%s", bookingDetails.TravelId, bookingDetails.BookingCode)

	// If booking code is already exists in the redis or database, then regenerate the new booking code
	isAlreadyExists := true
	for isAlreadyExists {
		isExists, err := r.redisClient.Exists(ctx, bookingKey).Result()

		if err != nil {
			return bookingDetails, err
		}

		if isExists == 0 {
			isAlreadyExists = false
			break
		} else {
			bookingDetails.BookingCode = helpers.GenerateBookingCode()
		}

	}

	// Set booking deadline
	bookingDetails.Deadline = time.Now().Add(time.Duration(300) * time.Second)

	bookingJson, err := json.Marshal(bookingDetails)

	if err != nil {
		return bookingDetails, err
	}

	err = r.redisClient.Set(
		ctx,
		bookingKey,
		string(bookingJson),
		// 0,
		time.Duration(300)*time.Second, // 5 minutes
	).Err()

	if err != nil {
		return bookingDetails, err
	}

	return bookingDetails, nil
}

func (r *BookingRedisRepository) GetBooking(ctx context.Context, travelId int64, bookingCode string) (model.BookingDetails, error) {

	var bookingDetails model.BookingDetails
	bookingKey := fmt.Sprintf("booking.%d.%s", travelId, bookingCode)
	val, err := r.redisClient.Get(ctx, bookingKey).Result()

	if err != nil {
		return bookingDetails, err
	}

	err = json.Unmarshal([]byte(val), &bookingDetails)
	if err != nil {
		return bookingDetails, err
	}

	// fmt.Println(val)

	return bookingDetails, nil
}
