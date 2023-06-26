package repository

import (
	"context"
	"database/sql"

	"github.com/ardimr/train-booking-system/internal/model"
)

func (q *PostgresRepository) ListTravels(ctx context.Context, param model.TravelScheduleReqParam) ([]model.TravelSchedule, error) {
	var travelSchedules []model.TravelSchedule
	sqlStatement := `
	WITH travel_class_cost AS (
		SELECT
			travel_costs.travel_id,
			classes.name as class_name,
			travel_costs."cost"
		FROM
			travel_schedules.travel_costs
			INNER JOIN travel_schedules.classes ON classes.id = travel_costs.class_id
		GROUP BY
			travel_costs.travel_id,
			classes.name,
			travel_costs.cost
	)
	SELECT
		travels.travel_id,
		travels.travel_code,
		trains.train_code,
		trains.name as train_name,
		travel_class_cost.class_name as train_class,
		travels.departure_station,
		travels.destination_station,
		travels.departure_schedule,
		travels.arrival_schedule,
		EXTRACT (HOUR FROM (travels.arrival_schedule - travels.departure_schedule)) || 'j ' || EXTRACT (MINUTE FROM (travels.arrival_schedule - travels.departure_schedule)) || 'm' as duration,
		travel_class_cost.cost
		
	FROM
		travel_schedules.travels
		INNER JOIN travel_schedules.trains ON travel_schedules.travels.train_code = travel_schedules.trains.train_code
		INNER JOIN travel_class_cost ON travel_class_cost.travel_id = travels.travel_id
	WHERE
		travels.departure_station = $1
		AND travels.destination_station = $2
		AND DATE(travels.departure_schedule) = $3
	ORDER BY
		departure_schedule ASC
	`

	// Querying
	rows, err := q.db.QueryContext(ctx, sqlStatement, param.DepartureStationCode, param.DestinationStationCode, param.DepartureDate)

	if err != nil {
		return nil, err
	}

	for rows.Next() {
		var travel model.TravelSchedule

		// read data
		err := rows.Scan(
			&travel.TravelID,
			&travel.TravelCode,
			&travel.TrainCode,
			&travel.TrainName,
			&travel.TrainClass,
			&travel.DepartureStation,
			&travel.DestinationStation,
			&travel.DepartureSchedule,
			&travel.ArrivalSchedule,
			&travel.Duration,
			&travel.Cost,
		)
		if err != nil {
			return nil, err
		}

		travelSchedules = append(travelSchedules, travel)
	}

	return travelSchedules, nil
}

func (q *PostgresRepository) GetTravelById(ctx context.Context, id int64) (*model.Travel, error) {
	var user model.Travel

	queryStatement := `
	SELECT
		*
	FROM public.users
	WHERE id=$1
	`
	err := q.db.QueryRowContext(ctx, queryStatement, id).Scan(
		&user.TravelID,
		&user.TravelCode,
	)

	if err != nil {
		return nil, sql.ErrNoRows
	}

	return &user, nil
}

func (q *PostgresRepository) AddNewTravel(ctx context.Context, newTravel model.Travel) (int64, error) {

	var newId int64

	sqlStatement := `
	INSERT INTO public.users (name) VALUES ($1) RETURNING id
	`

	err := q.db.QueryRowContext(ctx, sqlStatement, newTravel.TravelCode).Scan(&newId)

	if err != nil {
		return 0, err
	}

	return newId, nil
}

func (q *PostgresRepository) UpdateTravelById(ctx context.Context, id int64, newTravel model.Travel) (int64, error) {

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

func (q *PostgresRepository) DeleteTravel(ctx context.Context, id int64) error {

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
