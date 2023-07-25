package repository

import (
	"context"
	"encoding/json"
	"fmt"

	"github.com/ardimr/train-booking-system/internal/model"
)

func (r *RedisRepository) CreateBooking(ctx context.Context, booking model.BookingRequestBody) error {

	bookingJson, err := json.Marshal(booking)
	if err != nil {
		return err
	}

	username, err := r.redisClient.Get(ctx, "booking").Result()
	if err != nil {
		fmt.Println("Failed to get username from redis")
		return err
	}

	var res model.BookingRequestBody
	if err = json.Unmarshal([]byte(username), &res); err != nil {
		return err
	}
	fmt.Println("Username", res)
	// fmt.Println(string(bookingJson))

	op := r.redisClient.Set(
		ctx,
		"booking",
		string(bookingJson),
		0,
	)

	if op.Err() != nil {
		return op.Err()
	}

	// fmt.Println(res)

	return nil
}
