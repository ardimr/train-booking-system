package repository

import (
	"context"
	"encoding/json"
	"fmt"

	bookingModel "github.com/ardimr/train-booking-system/internal/booking/model"
	"github.com/redis/go-redis/v9"
)

type ISeatRedisRepository interface {
	GetBookedSeats(ctx context.Context, travelId int64) ([]int64, error)
}

type SeatRedisRepository struct {
	rc *redis.Client
}

func NewSeatRedisRepository(rc *redis.Client) *SeatRedisRepository {
	return &SeatRedisRepository{
		rc: rc,
	}
}

// Implementation
func (r *SeatRedisRepository) GetBookedSeats(ctx context.Context, travelId int64) ([]int64, error) {
	bookingFormat := fmt.Sprintf("booking.%d.*", travelId)
	seats := []int64{}
	iter := r.rc.Scan(ctx, 0, bookingFormat, 0).Iterator()

	for iter.Next(ctx) {
		bookingKey := iter.Val()

		// Get seat id
		var bookingDetails bookingModel.BookingDetails
		bookingRedis, err := r.rc.Get(ctx, bookingKey).Result()
		if err != nil {
			return nil, err
		}

		if err := json.Unmarshal([]byte(bookingRedis), &bookingDetails); err != nil {
			return nil, err
		}

		for _, passenger := range bookingDetails.PassengerDetails {
			seats = append(seats, passenger.SeatId)
		}

	}
	if err := iter.Err(); err != nil {
		panic(err)
	}

	return seats, nil
}
