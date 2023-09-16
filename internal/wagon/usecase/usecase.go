package usecase

import (
	"github.com/ardimr/train-booking-system/internal/wagon/repository"
)

type IWagonUseCase interface {
}

type WagonUseCase struct {
	wagonRepo repository.IWagonRepository
}

func NewWagonUseCae(wagonRepo repository.IWagonRepository) *WagonUseCase {
	return &WagonUseCase{
		wagonRepo: wagonRepo,
	}
}
