package repository

import (
	"context"
	"encoding/json"
	"time"

	"github.com/ardimr/train-booking-system/internal/auth/model"

	"github.com/redis/go-redis/v9"
)

type IAuthRedisRepository interface {
	SetUserOTP(ctx context.Context, key string, userOTP model.UserOTPVerification, expiration time.Duration) error
	GetUserOTP(ctx context.Context, key string) (model.UserOTPVerification, error)
	RemoveUserOTP(ctx context.Context, key string) error
}

type AuthRedisRepository struct {
	redisClient *redis.Client
}

func NewAuthRedisRepository(redisClient *redis.Client) *AuthRedisRepository {
	return &AuthRedisRepository{
		redisClient: redisClient,
	}
}

func (rc *AuthRedisRepository) SetUserOTP(ctx context.Context, key string, userOTP model.UserOTPVerification, expiration time.Duration) error {

	userOTPBytes, err := json.Marshal(userOTP)

	if err != nil {
		return err
	}

	err = rc.redisClient.Set(
		ctx,
		key,
		userOTPBytes,
		expiration,
	).Err()

	return err
}

func (rc *AuthRedisRepository) GetUserOTP(ctx context.Context, key string) (model.UserOTPVerification, error) {
	var userOTP model.UserOTPVerification
	_userOTP, err := rc.redisClient.Get(ctx, key).Result()

	if err != nil {
		return userOTP, err
	}

	if err := json.Unmarshal([]byte(_userOTP), &userOTP); err != nil {
		return userOTP, err
	}

	return userOTP, nil
}

func (rc *AuthRedisRepository) RemoveUserOTP(ctx context.Context, key string) error {
	err := rc.redisClient.Del(ctx, key).Err()

	return err
}
