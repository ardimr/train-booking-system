package usecase

import (
	"context"

	"github.com/ardimr/train-booking-system/internal/user/model"
	"github.com/ardimr/train-booking-system/internal/user/repository"
)

type IUserUseCase interface {
	GetUserDetails(ctx context.Context, userId int64) (model.UserDetails, error)
}

type UserUseCase struct {
	userRepo repository.IUserRepository
}

func NewUserUseCae(userRepo repository.IUserRepository) *UserUseCase {
	return &UserUseCase{
		userRepo: userRepo,
	}
}

func (uc *UserUseCase) GetUserDetails(ctx context.Context, userId int64) (model.UserDetails, error) {

	userDetails, err := uc.userRepo.GetUserDetails(ctx, userId)

	if err != nil {
		return userDetails, err
	}

	return userDetails, nil
}
