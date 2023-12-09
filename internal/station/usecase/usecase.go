package usecase

import (
	"context"

	"github.com/ardimr/train-booking-system/internal/station/model"
	"github.com/ardimr/train-booking-system/internal/station/repository"
)

type IStationUseCase interface {
	GetStations(ctx context.Context, param model.StationRequestParam) ([]model.CityStation, error)
	AddStation(ctx context.Context, newStation model.NewStation) error
	EditStation(ctx context.Context, stationCode string, newStation model.NewStation) error
	DeleteStation(ctx context.Context, stationCode string) error
}

type StationUseCase struct {
	stationRepo repository.IStationRepository
}

func NewStationUsecase(stationRepo repository.IStationRepository) *StationUseCase {
	return &StationUseCase{
		stationRepo: stationRepo,
	}
}

func (uc *StationUseCase) GetStations(ctx context.Context, param model.StationRequestParam) ([]model.CityStation, error) {
	// Get the stations data from repository
	cityCtations, err := uc.stationRepo.GetStations(ctx, param)

	if err != nil {
		return nil, err
	}
	return cityCtations, nil
}

func (uc *StationUseCase) AddStation(ctx context.Context, newStation model.NewStation) error {
	// Add station to repository
	err := uc.stationRepo.AddStation(ctx, newStation)

	if err != nil {
		return err
	}

	return nil
}

func (uc *StationUseCase) EditStation(ctx context.Context, stationCode string, newStation model.NewStation) error {
	// Edit or update station information to repository
	err := uc.stationRepo.UpdateStation(ctx, stationCode, newStation)

	if err != nil {
		return err
	}

	return nil
}

func (uc *StationUseCase) DeleteStation(ctx context.Context, stationCode string) error {
	// Delete a station from repository
	err := uc.stationRepo.DeleteStation(ctx, stationCode)

	if err != nil {
		return err
	}
	return nil
}
