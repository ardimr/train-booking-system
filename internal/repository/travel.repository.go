package repository

import (
	"context"
	"database/sql"
	"encoding/json"

	"github.com/ardimr/train-booking-system/internal/model"
)

func (q *PostgresRepository) ListTravels(ctx context.Context, param model.TravelScheduleReqParam) ([]model.TravelSchedule, error) {
	var travelSchedules []model.TravelSchedule
	sqlStatement := `
	WITH available_travel_seats AS (
		SELECT
			travels.travel_id,
			--         travels.travel_code,
			--         train_cars.train_code,
			seats.id as seat_id,
			classes.id AS class_id
		FROM
			travel_schedules.seats
			INNER JOIN travel_schedules.train_cars ON train_cars.id = seats.train_car_id
			INNER JOIN travel_schedules.classes ON classes.id = train_cars.class_id
			INNER JOIN travel_schedules.trains ON trains.train_code = train_cars.train_code
			INNER JOIN travel_schedules.travels ON travels.train_code = trains.train_code
	),
	travel_tickets AS (
		SELECT
			travel_id,
			seat_id
		FROM
			travel_schedules.tickets
	),
	num_available_seats AS (
		SELECT
			available_travel_seats.travel_id,
			available_travel_seats.class_id,
			-- 	travel_tickets.seat_id
			COUNT(
				CASE
					WHEN travel_tickets.seat_id IS NULL THEN 1
				END
			) as available_seats
		FROM
			available_travel_seats
			LEFT JOIN travel_tickets ON (
				travel_tickets.travel_id = available_travel_seats.travel_id
			)
			AND (
				travel_tickets.seat_id = available_travel_seats.seat_id
			)
		GROUP BY
			available_travel_seats.travel_id,
			available_travel_seats.class_id
		ORDER BY
			travel_id
	),
	schedules AS (
		SELECT
			travels.travel_id,
			travels.travel_code,
			trains.train_code,
			trains.name as train_name,
			--         classes.id as train_class_id,
			classes.class_code as wagon_class_code,
			classes.name as wagon_class_name,
	--         departure_station.station_code as departure_station_code,	
	--         destination_station.station_code as destination_station_code,
			json_build_object('code', departure_station.station_code, 'name', departure_station.name) AS departure_station,
			json_build_object('code', departure_station.station_code, 'name', departure_station.name) AS departure_station,
			travels.departure_schedule,
			travels.arrival_schedule,
			EXTRACT (
				HOUR
				FROM
					(
						travels.arrival_schedule - travels.departure_schedule
					)
			) AS duration_hour,
			EXTRACT (
				MINUTE
				FROM
					(
						travels.arrival_schedule - travels.departure_schedule
					)
			) AS duration_minute,
			json_build_object('currency', travel_costs.currency_code, 'amount', travel_costs.cost) AS cost,
			num_available_seats.available_seats
		FROM
			travel_schedules.travels
			INNER JOIN travel_schedules.stations departure_station ON departure_station.station_code = travels.departure_station -- join table for departure station
			INNER JOIN travel_schedules.stations destination_station ON destination_station.station_code = travels.destination_station -- join table for destination station
			INNER JOIN travel_schedules.trains ON travel_schedules.travels.train_code = travel_schedules.trains.train_code -- join table for train information
			INNER JOIN travel_schedules.travel_costs ON travel_costs.travel_id = travels.travel_id -- join table for travel costs
			INNER JOIN num_available_seats ON num_available_seats.travel_id = travels.travel_id -- join table for available seats
			AND num_available_seats.class_id = travel_costs.class_id
			INNER JOIN travel_schedules.classes ON classes.id = travel_costs.class_id -- join table for the travel class
		WHERE
			departure_station.station_code = $1
			AND destination_station.station_code = $2
			AND DATE(departure_schedule) = $3
		ORDER BY
			departure_schedule ASC
	)
	SELECT
		*
	FROM
		schedules
	
	`

	// Querying
	rows, err := q.db.QueryContext(ctx, sqlStatement, param.DepartureStationCode, param.DestinationStationCode, param.DepartureDate)

	if err != nil {
		return nil, err
	}

	for rows.Next() {
		var travel model.TravelSchedule

		var departureStationRaw []byte
		var destinationStaionRaw []byte
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
			&travel.Duration.Hour,
			&travel.Duration.Minute,
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

		if err := json.Unmarshal(costRaw, &travel.Cost); err != nil {
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
