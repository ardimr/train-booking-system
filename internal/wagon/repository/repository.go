package repository

import (
	"github.com/ardimr/train-booking-system/configs/db"
)

type IWagonRepository interface {
}

type WagonRepository struct {
	db db.DBInterface
}

func NewWagonRepository(db db.DBInterface) *WagonRepository {
	return &WagonRepository{
		db: db,
	}
}
