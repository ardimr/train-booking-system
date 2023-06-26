package repository

import (
	"context"

	"github.com/ardimr/train-booking-system/configs/db"
	"github.com/ardimr/train-booking-system/internal/model"
)

type Repository interface {
	ListTravels(ctx context.Context, param model.TravelScheduleReqParam) ([]model.TravelSchedule, error)
	GetTravelById(ctx context.Context, id int64) (*model.Travel, error)
	AddNewTravel(ctx context.Context, newTravel model.Travel) (int64, error)
	UpdateTravelById(ctx context.Context, id int64, newTravel model.Travel) (int64, error)
	DeleteTravel(ctx context.Context, id int64) error
}

type PostgresRepository struct {
	db db.DBInterface
}

func NewPostgresRepository(db db.DBInterface) *PostgresRepository {
	return &PostgresRepository{
		db: db,
	}
}

// Query Implementation
