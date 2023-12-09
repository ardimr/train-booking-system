package usecase

import (
	"context"

	"github.com/ardimr/train-booking-system/internal/train/model"
	"github.com/ardimr/train-booking-system/internal/train/repository"
)

type ITrainUseCase interface {
	ListTrains(ctx context.Context, param model.RequestParam) ([]model.Train, error)
	GetTrainByCode(ctx context.Context, trainCode string) (model.Train, error)
	AddNewTrain(ctx context.Context, newTrain model.Train) error
	EditTrain(ctx context.Context, trainCode string, newTrain model.Train) error
	DeleteTrain(ctx context.Context, trainCode string) error
}

type TrainUseCase struct {
	trainRepo repository.ITrainRepository
}

func NewTrainUseCase(trainRepo repository.ITrainRepository) *TrainUseCase {
	return &TrainUseCase{
		trainRepo: trainRepo,
	}
}

func (uc *TrainUseCase) ListTrains(ctx context.Context, param model.RequestParam) ([]model.Train, error) {
	var trains []model.Train
	trains, err := uc.trainRepo.GetTrains(ctx, param)

	if err != nil {
		return nil, err
	}
	return trains, nil
}

func (uc *TrainUseCase) GetTrainByCode(ctx context.Context, trainCode string) (model.Train, error) {
	var train model.Train

	train, err := uc.trainRepo.GetTrainByCode(ctx, trainCode)
	if err != nil {
		return train, err
	}

	return train, nil
}

func (uc *TrainUseCase) AddNewTrain(ctx context.Context, newTrain model.Train) error {
	if err := uc.trainRepo.AddTrain(ctx, newTrain); err != nil {
		return err
	}

	return nil
}

func (uc *TrainUseCase) EditTrain(ctx context.Context, trainCode string, newTrain model.Train) error {
	if err := uc.trainRepo.UpdateTrain(ctx, trainCode, newTrain); err != nil {
		return err
	}

	return nil
}

func (uc *TrainUseCase) DeleteTrain(ctx context.Context, trainCode string) error {
	if err := uc.trainRepo.DeleteTrain(ctx, trainCode); err != nil {
		return err
	}

	return nil
}
