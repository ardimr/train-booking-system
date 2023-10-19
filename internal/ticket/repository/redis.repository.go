package repository

import (
	"context"
	"encoding/json"
	"fmt"

	"github.com/ardimr/train-booking-system/internal/booking/model"
	"github.com/redis/go-redis/v9"
)

type ITicketRedisRepository interface {
	GetBooking(ctx context.Context, travelId int64, bookingCode string) (model.BookingDetails, error)
}

type TicketRedisRepository struct {
	redisClient *redis.Client
}

func NewRedisRepository(redisClient *redis.Client) *TicketRedisRepository {
	return &TicketRedisRepository{
		redisClient: redisClient,
	}
}

// Redis implementation

func (r *TicketRedisRepository) GetBooking(ctx context.Context, travelId int64, bookingCode string) (model.BookingDetails, error) {

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
