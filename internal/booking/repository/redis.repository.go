package repository

import (
	"context"
	"encoding/json"
	"fmt"
	"time"

	"github.com/ardimr/train-booking-system/internal/booking/model"
	"github.com/redis/go-redis/v9"
)

type IBookingRedisRepository interface {
	GetBooking(ctx context.Context, travelId int64, bookingCode string) (model.BookingDetails, error)
	CheckKey(ctx context.Context, bookingKey string) (int64, error)
	SetBooking(ctx context.Context, bookingKey string, bookingJson []byte, expiration time.Duration) error
	LockSeats(ctx context.Context, seatKeys []string, expiration time.Duration) error
	ReleaseLock(ctx context.Context, seatKey string) error
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

func (r *BookingRedisRepository) SetBooking(ctx context.Context, bookingKey string, bookingJson []byte, expiration time.Duration) error {
	err := r.redisClient.Set(
		ctx,
		bookingKey,
		bookingJson,
		expiration,
	).Err()

	return err
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

func (r *BookingRedisRepository) CheckKey(ctx context.Context, bookingKey string) (int64, error) {
	countKeys, err := r.redisClient.Exists(ctx, bookingKey).Result()

	return countKeys, err
}

func (r *BookingRedisRepository) LockSeats(ctx context.Context, seatKeys []string, expiration time.Duration) error {
	data := map[string]interface{}{}

	for _, seatKey := range seatKeys {
		data[seatKey] = true
	}

	err := r.redisClient.MSet(ctx, data).Err()
	if err != nil {
		return err
	}

	return nil
}

func (r *BookingRedisRepository) ReleaseLock(ctx context.Context, seatKey string) error {
	_, err := r.redisClient.Del(ctx, seatKey).Result()
	return err
}
