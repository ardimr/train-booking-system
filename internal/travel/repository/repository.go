package repository

import (
	"context"
	"database/sql"
	"encoding/json"
	"fmt"

	"github.com/ardimr/train-booking-system/configs/db"
	"github.com/ardimr/train-booking-system/internal/travel/model"
)

type ITravelRepository interface {
	ListTravels(ctx context.Context, param model.TravelScheduleReqParam) ([]model.TravelSchedule, error)
	GetTravelById(ctx context.Context, id int64, class string) (model.Travel, error)
	AddNewTravel(ctx context.Context, newTravel model.AddNewTravel) (int64, error)
	UpdateTravelById(ctx context.Context, id int64, newTravel model.Travel) (int64, error)
	DeleteTravel(ctx context.Context, id int64) error
}

type TravelRepository struct {
	db db.DBInterface
}

func NewTravelRepository(db db.DBInterface) *TravelRepository {
	return &TravelRepository{
		db: db,
	}
}

// Implementation
func (q *TravelRepository) ListTravels(ctx context.Context, param model.TravelScheduleReqParam) ([]model.TravelSchedule, error) {
	var travelSchedules []model.TravelSchedule

	// Querying
	rows, err := q.db.QueryContext(ctx, listTravelsStatement, param.DepartureStationCode, param.DestinationStationCode, param.DepartureDate)

	if err != nil {
		return nil, err
	}

	for rows.Next() {
		var travel model.TravelSchedule

		var departureStationRaw []byte
		var destinationStaionRaw []byte
		var durationRaw []byte
		var costRaw []byte

		// read data
		err := rows.Scan(
			&travel.TravelID,
			&travel.TravelCode,
			&travel.TrainCode,
			&travel.TrainName,
			&travel.WagonClass.Code,
			&travel.WagonClass.Name,
			&departureStationRaw,
			&destinationStaionRaw,
			&travel.DepartureSchedule,
			&travel.ArrivalSchedule,
			&durationRaw,
			&costRaw,
			&travel.AvailableSeats,
		)

		if err != nil {
			return nil, err
		}

		// Unmarshal departure station and destination station
		if err := json.Unmarshal(departureStationRaw, &travel.DepartureStation); err != nil {
			return nil, err
		}

		if err := json.Unmarshal(destinationStaionRaw, &travel.DestinationStation); err != nil {
			return nil, err
		}

		if err := json.Unmarshal(durationRaw, &travel.Duration); err != nil {
			return nil, err
		}

		if err := json.Unmarshal(costRaw, &travel.Cost); err != nil {
			return nil, err
		}

		travelSchedules = append(travelSchedules, travel)
	}

	return travelSchedules, nil
}

func (q *TravelRepository) GetTravelById(ctx context.Context, id int64, class string) (model.Travel, error) {
	var travel model.Travel

	var departureStationRaw []byte
	var destinationStaionRaw []byte
	var durationRaw []byte
	var fareRaw []byte
	var wagonClassRaw []byte

	err := q.db.QueryRowContext(ctx, getTravelByIdStatement, id, class).Scan(
		&travel.TravelID,
		&travel.TravelCode,
		&travel.TrainCode,
		&travel.TrainName,
		&wagonClassRaw,
		&travel.DepartureSchedule,
		&travel.ArrivalSchedule,
		&departureStationRaw,
		&destinationStaionRaw,
		&durationRaw,
		&fareRaw,
	)

	if err != nil {
		return travel, sql.ErrNoRows
	}

	if err := json.Unmarshal(departureStationRaw, &travel.DepartureStation); err != nil {
		return travel, err
	}

	if err := json.Unmarshal(destinationStaionRaw, &travel.DestinationStation); err != nil {
		return travel, err
	}

	if err := json.Unmarshal(wagonClassRaw, &travel.WagonClass); err != nil {
		return travel, err
	}

	if err := json.Unmarshal(durationRaw, &travel.Duration); err != nil {
		return travel, err
	}

	if err := json.Unmarshal(fareRaw, &travel.Fare); err != nil {
		return travel, err
	}

	return travel, nil
}

func (q *TravelRepository) AddNewTravel(ctx context.Context, newTravel model.AddNewTravel) (int64, error) {

	var newTravelId int64

	tx, err := q.db.BeginTx(ctx, &sql.TxOptions{Isolation: sql.LevelDefault})

	if err != nil {
		return newTravelId, err
	}

	// insert travel
	err = tx.QueryRowContext(ctx,
		addTravelStatement,
		newTravel.TravelCode,
		newTravel.DepartureSchedule,
		newTravel.ArrivalSchedule,
		newTravel.DepartureStation.Code,
		newTravel.DestinationStation.Code,
		newTravel.TrainCode).Scan(&newTravelId)

	if err != nil {
		fmt.Println("Error travelID", err.Error())
		return newTravelId, err
	}

	// insert travel fares
	// var travelFareId int64
	for _, fare := range newTravel.Fares {
		_, err = tx.ExecContext(ctx,
			addFareStatement,
			newTravelId,
			fare.ClassId,
			fare.Amount,
			fare.Currency,
		)

		if err != nil {
			fmt.Println("Error Travel Fare Input", err.Error())
			return newTravelId, err
		}
	}
	tx.Commit()
	return newTravelId, nil
}

func (q *TravelRepository) UpdateTravelById(ctx context.Context, id int64, newTravel model.Travel) (int64, error) {

	sqlStatement := `
	UPDATE public.users SET name=$2 WHERE id=$1
	`

	res, err := q.db.ExecContext(ctx, sqlStatement, newTravel.TravelID, newTravel.TravelCode)

	if err != nil {
		return 0, err
	}

	rowsAffected, err := res.RowsAffected()

	if err != nil {
		return 0, err
	}
	return rowsAffected, nil
}

func (q *TravelRepository) DeleteTravel(ctx context.Context, id int64) error {

	// create sql statement to delete user from database
	sqlStatement := `DELETE FROM public.users WHERE id=$1`

	// execute sql statement
	res, err := q.db.ExecContext(ctx, sqlStatement, id)

	if err != nil {
		return err
	}

	rowsAffected, _ := res.RowsAffected()

	if rowsAffected < 1 {
		return sql.ErrNoRows
	}
	return nil
}
