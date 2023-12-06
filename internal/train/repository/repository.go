package repository

import (
	"context"
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"strings"

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

	rows, err := q.db.QueryContext(ctx, GetTrainsStatement)
	if err != nil {
		return nil, err
	}

	for rows.Next() {
		var train model.Train
		var rawWagons []byte

		err := rows.Scan(
			&train.Code,
			&train.Name,
			&rawWagons,
		)

		if err != nil {
			return nil, err
		}

		// Unmarshal rawWagons
		if err := json.Unmarshal(rawWagons, &train.Wagons); err != nil {
			return nil, err
		}

		trains = append(trains, train)

	}
	return trains, nil

}

func (q *TrainRepository) GetTrainByCode(ctx context.Context, trainCode string) (model.Train, error) {

	var train model.Train
	var rawWagons []byte
	err := q.db.QueryRowContext(ctx, GetTrainByCodeStatement, trainCode).Scan(
		&train.Code,
		&train.Name,
		&rawWagons,
	)

	if err != nil {
		return train, err
	}

	if err := json.Unmarshal(rawWagons, &train.Wagons); err != nil {
		return train, err
	}

	return train, nil
}

func (q *TrainRepository) AddTrain(ctx context.Context, newTrain model.Train) error {
	seatColumns := []string{"A", "B", "C", "D"}
	// Use transaction
	tx, err := q.db.BeginTx(ctx, &sql.TxOptions{Isolation: sql.LevelDefault})

	if err != nil {
		return err
	}

	// Insert train
	_, err = tx.ExecContext(ctx, AddTrainStatement, newTrain.Code, newTrain.Name)
	if err != nil {
		return err
	}

	var newWagonId int64
	// Insert wagons
	for _, wagon := range newTrain.Wagons {
		err = tx.QueryRowContext(
			ctx,
			AddWagonStatement,
			newTrain.Code,
			wagon.Capacity,
			wagon.ClassId,
			wagon.WagonNumber,
		).Scan(&newWagonId)

		if err != nil {
			if err := tx.Rollback(); err != nil {
				log.Println(err)
			}
			return err
		}

		// Insert Seats for each wagons
		var (
			placeholders []string
			vals         []interface{}
		)

		offset := 0
		for i := 0; i < 15; i++ {
			seatRow := i + 1

			for index, seatColumn := range seatColumns {
				placeholders = append(placeholders, fmt.Sprintf("($%d,$%d,$%d)",
					(index+offset)*3+1,
					(index+offset)*3+2,
					(index+offset)*3+3,
				))
				vals = append(vals, seatRow, seatColumn, newWagonId)
			}

			offset += 4
		}

		inserteatsStatement := fmt.Sprintf(AddSeatStatement, strings.Join(placeholders, ","))

		_, err = tx.ExecContext(ctx, inserteatsStatement, vals...)
		if err != nil {
			tx.Rollback()
			return err
		}
	}

	// Commit transaction
	if err = tx.Commit(); err != nil {
		return err
	}

	return nil
}

func (q *TrainRepository) UpdateTrain(ctx context.Context, trainCode string, newTrain model.Train) error {

	return nil
}

func (q *TrainRepository) DeleteTrain(ctx context.Context, trainCode string) error {
	return nil
}
