package repository

import (
	"context"
	"database/sql"
	"encoding/json"
	"fmt"
	"strings"

	"github.com/ardimr/train-booking-system/internal/model"
)

func (q *PostgresRepository) FindAvailableSeats(ctx context.Context, param model.AvailableSeatRequestParam) ([]model.AvailableSeat, error) {
	var availableSeats []model.AvailableSeat

	queryStatement := `
	WITH available_travel_seats AS (
		SELECT
			travels.travel_id,
			travels.travel_code,
			train_cars.train_car_id,
			seats.seat_id,
			seats.seat_row,
			seats.seat_column,
			classes.class_code || train_cars.train_car_no || '-' || seats.seat_row || seats.seat_column as seat_label
		FROM
			travel_schedules.seats
			INNER JOIN travel_schedules.train_cars ON train_cars.train_car_id = seats.train_car_id
			INNER JOIN travel_schedules.classes ON classes.id = train_cars.class_id
			INNER JOIN travel_schedules.trains ON trains.train_code = train_cars.train_code
			INNER JOIN travel_schedules.travels ON travels.train_code = trains.train_code
		WHERE
			travels.travel_id = $1
	),
	travel_tickets AS (
		SELECT
			tickets.travel_id,
			tickets.ticket_id,
			tickets.user_id,
			passengers.seat_id
		FROM
			bookings.tickets
			INNER JOIN bookings.passengers ON passengers.ticket_id = tickets.ticket_id
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
				ORDER BY seat_column
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
			classes.class_code as train_car_class,
			train_cars.train_car_no,
			row_elements as seating_rows
		FROM
			seating_rows
			INNER JOIN travel_schedules.train_cars ON train_cars.train_car_id = seating_rows.train_car_id
			INNER JOIN travel_schedules.classes ON classes.id = train_cars.class_id
	)
	SELECT
		*
	FROM
		available_seats
	WHERE train_car_class = $2
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

func (r *RedisRepository) GetBookedSeats(ctx context.Context, travelId int64) ([]int64, error) {
	bookingFormat := fmt.Sprintf("booking.%d.*", travelId)
	seats := []int64{}
	iter := r.redisClient.Scan(ctx, 0, bookingFormat, 0).Iterator()

	for iter.Next(ctx) {
		bookingKey := iter.Val()

		// Get seat id
		var bookingDetails model.BookingDetails
		bookingRedis, err := r.redisClient.Get(ctx, bookingKey).Result()
		if err != nil {
			return nil, err
		}

		if err := json.Unmarshal([]byte(bookingRedis), &bookingDetails); err != nil {
			return nil, err
		}

		for _, passenger := range bookingDetails.PassengerDetails {
			seats = append(seats, passenger.SeatId)
		}

	}
	if err := iter.Err(); err != nil {
		panic(err)
	}

	return seats, nil
}

func (q *PostgresRepository) AddSeats(ctx context.Context, wagonId int64, numberOfRows int) error {
	seatColumns := []string{"A", "B", "C", "D"}

	var (
		placeholders []string
		vals         []interface{}
	)

	offset := 0
	for i := 0; i < numberOfRows; i++ {
		seatRow := i + 1

		for index, seatColumn := range seatColumns {
			placeholders = append(placeholders, fmt.Sprintf("($%d,$%d,$%d)",
				(index+offset)*3+1,
				(index+offset)*3+2,
				(index+offset)*3+3,
			))
			vals = append(vals, seatRow, seatColumn, wagonId)
		}

		offset += 4
	}

	insertStatement := fmt.Sprintf("INSERT INTO travel_schedules.seats (seat_row,seat_column,train_car_id) VALUES %s", strings.Join(placeholders, ","))
	fmt.Println(insertStatement)

	tx, err := q.db.BeginTx(ctx, &sql.TxOptions{Isolation: sql.LevelDefault})
	if err != nil {
		return err
	}

	_, err = tx.Exec(insertStatement, vals...)
	if err != nil {
		tx.Rollback()
		return err
	}

	if err = tx.Commit(); err != nil {
		return err
	}

	// fmt.Println(vals...)

	return nil
}
