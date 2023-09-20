package usecase

import (
	"context"

	"github.com/ardimr/train-booking-system/internal/travel/model"
	"github.com/ardimr/train-booking-system/internal/travel/repository"
)

type ITravelUseCase interface {
	ListTravels(ctx context.Context, param model.TravelScheduleReqParam) ([]model.TravelSchedule, error)
	GetTravelById(ctx context.Context, id int64, class string) (model.Travel, error)
	AddNewTravel(ctx context.Context, newTravel model.AddNewTravel) (int64, error)
	// UpdateTravelById(ctx context.Context, id int64, newTravel model.Travel) (int64, error)
	// DeleteTravel(ctx context.Context, id int64) error
}

type TravelUseCase struct {
	travelRepo repository.ITravelRepository
}

func NewTravelUseCase(travelRepo repository.ITravelRepository) *TravelUseCase {
	return &TravelUseCase{
		travelRepo: travelRepo,
	}
}

func (uc *TravelUseCase) ListTravels(ctx context.Context, param model.TravelScheduleReqParam) ([]model.TravelSchedule, error) {
	// Get list of travels
	travels, err := uc.travelRepo.ListTravels(ctx, param)

	if err != nil {

		return nil, err
	}

	return travels, nil
}

func (uc *TravelUseCase) GetTravelById(ctx context.Context, id int64, class string) (model.Travel, error) {
	// Get travel by id
	var travelDetails model.Travel
	travelDetails, err := uc.travelRepo.GetTravelById(ctx, id, class)

	if err != nil {
		return travelDetails, err
	}

	return travelDetails, nil

}

func (uc *TravelUseCase) AddNewTravel(ctx context.Context, newTravel model.AddNewTravel) (int64, error) {
	// Add new travel
	newId, err := uc.travelRepo.AddNewTravel(ctx, newTravel)

	if err != nil {
		return 0, err
	}

	return newId, nil
}
