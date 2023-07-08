package repository

import (
	"context"
	"encoding/json"

	"github.com/ardimr/train-booking-system/internal/model"
)

func (q *PostgresRepository) FindAvailableSeats(ctx context.Context, param model.AvailableSeatRequestParam) ([]model.AvailableSeat, error) {
	var availableSeats []model.AvailableSeat

	queryStatement := `
	WITH available_travel_seats AS (
		SELECT
			travels.travel_id,
			travels.travel_code,
			train_cars.id as train_car_id,
			seats.id as seat_id,
			seats.seat_row,
			seats.seat_column,
			classes.class_code || train_cars.train_car_no || '-' || seats.seat_row || seats.seat_column as seat_label
		FROM
			travel_schedules.seats
			INNER JOIN travel_schedules.train_cars ON train_cars.id = seats.train_car_id
			INNER JOIN travel_schedules.classes ON classes.id = train_cars.class_id
			INNER JOIN travel_schedules.trains ON trains.train_code = train_cars.train_code
			INNER JOIN travel_schedules.travels ON travels.train_code = trains.train_code
		WHERE
			travels.travel_id = $1
	),
	travel_tickets AS (
		SELECT
			*
		FROM
			travel_schedules.tickets
		WHERE
			tickets.travel_id = $1
	),
	row_elements AS (
		SELECT
			available_travel_seats.train_car_id,
			available_travel_seats.seat_row,
			json_agg(
				json_build_object(
					'seat_id',
					available_travel_seats.seat_id,
					'seat_row',
					available_travel_seats.seat_row,
					'seat_column',
					available_travel_seats.seat_column,
					'seat_label',
					available_travel_seats.seat_label,
					'available',
					CASE
						WHEN travel_tickets.seat_id IS NULL THEN TRUE
						ELSE FALSE
					END
				)
			) AS seating_row_elements
		FROM
			available_travel_seats
			LEFT JOIN travel_tickets ON (
				travel_tickets.travel_id = available_travel_seats.travel_id
			)
			AND (
				travel_tickets.seat_id = available_travel_seats.seat_id
			)
		WHERE
			available_travel_seats.travel_id = $1
		GROUP BY
			available_travel_seats.train_car_id,
			available_travel_seats.seat_row
		ORDER BY
			train_car_id,
			seat_row ASC
	),
	seating_rows AS (
		SELECT
			train_car_id,
			json_agg(
				json_build_object (
					'row_elements',
					seating_row_elements
				)
			) as row_elements
		FROM
			row_elements
		GROUP BY
			train_car_id
	),
	available_seats AS (
		SELECT
			classes.class_code as wagon_class,
			train_cars.train_car_no as wagon_number,
			row_elements as seating_rows
		FROM
			seating_rows
			INNER JOIN travel_schedules.train_cars ON train_cars.id = seating_rows.train_car_id
			INNER JOIN travel_schedules.classes ON classes.id = train_cars.class_id
	)
	SELECT
		*
	FROM
		available_seats
	WHERE wagon_class = $2
	`

	rows, err := q.db.QueryContext(ctx, queryStatement, param.TravelId, param.WagonClassCode)

	if err != nil {
		return nil, err
	}

	for rows.Next() {
		var availableSeat model.AvailableSeat
		var seatingRowsRaw []byte

		err = rows.Scan(
			&availableSeat.WagonClass,
			&availableSeat.WagonNumber,
			&seatingRowsRaw,
		)

		if err != nil {
			return nil, err
		}

		// Unmarshal seating rows
		if err = json.Unmarshal(seatingRowsRaw, &availableSeat.SeatingRows); err != nil {
			return nil, err
		}

		availableSeats = append(availableSeats, availableSeat)

	}

	return availableSeats, nil
}
