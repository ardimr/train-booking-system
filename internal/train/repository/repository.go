package repository

import (
	"context"

	"github.com/ardimr/train-booking-system/configs/db"
	"github.com/ardimr/train-booking-system/internal/train/model"
)

type ITrainRepository interface {
	GetTrains(ctx context.Context, param model.RequestParam) ([]model.Train, error)
	GetTrainByCode(ctx context.Context, trainCode string) (model.Train, error)
	AddTrain(ctx context.Context, newTrain model.Train) error
	UpdateTrain(ctx context.Context, trainCode string, newTrain model.Train) error
	DeleteTrain(ctx context.Context, trainCode string) error
}

type TrainRepository struct {
	db db.DBInterface
}

func NewTrainRepository(db db.DBInterface) *TrainRepository {
	return &TrainRepository{
		db: db,
	}
}

func (q *TrainRepository) GetTrains(ctx context.Context, param model.RequestParam) ([]model.Train, error) {
	var trains []model.Train

	return trains, nil

}

func (q *TrainRepository) GetTrainByCode(ctx context.Context, trainCode string) (model.Train, error) {

	var train model.Train

	return train, nil
}

func (q *TrainRepository) AddTrain(ctx context.Context, newTrain model.Train) error {

	return nil
}

func (q *TrainRepository) UpdateTrain(ctx context.Context, trainCode string, newTrain model.Train) error {

	return nil
}

func (q *TrainRepository) DeleteTrain(ctx context.Context, trainCode string) error {
	return nil
}
