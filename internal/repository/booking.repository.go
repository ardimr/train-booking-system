package repository

import (
	"context"
	"database/sql"
	"encoding/json"
	"fmt"
	"time"

	"github.com/ardimr/train-booking-system/internal/helpers"
	"github.com/ardimr/train-booking-system/internal/model"
)

// Redis implementation
func (r *RedisRepository) CreateBooking(ctx context.Context, booking model.BookingRequestBody) (string, error) {

	// Generate booking code
	var bookingCode string
	bookingCode = helpers.GenerateBookingCode()

	// If booking code is already exists in the redis or database, then regenerate the new booking code
	isAlreadyExists := true
	for isAlreadyExists {
		isExists, err := r.redisClient.Exists(ctx, bookingCode).Result()

		if err != nil {
			return "", err
		}

		if isExists == 0 {
			isAlreadyExists = false
			break
		} else {
			bookingCode = helpers.GenerateBookingCode()
		}

	}

	bookingJson, err := json.Marshal(booking)

	if err != nil {
		return "", err
	}

	err = r.redisClient.Set(
		ctx,
		bookingCode,
		string(bookingJson),
		time.Duration(300)*time.Second,
	).Err()

	if err != nil {
		return "", err
	}

	return bookingCode, nil
}

func (q *PostgresRepository) CreateBooking(ctx context.Context, bookingCode string, booking model.BookingRequestBody) error {

	tx, err := q.db.BeginTx(ctx, &sql.TxOptions{})

	if err != nil {
		return err
	}

	// Store Booking into db
	sqlStatementBooking := `
	INSERT INTO
		bookings.bookings (booking_code, status, total_amount)
	VALUES
		($1, 'PAID', '150000')
	`
	_, err = tx.ExecContext(ctx, sqlStatementBooking, bookingCode)

	if err != nil {
		if rbErr := tx.Rollback(); rbErr != nil {
			return fmt.Errorf("tx err: %v, rb err: %v", err, rbErr)
		}
		return err
	}

	// Get user id

	// Generate ticket
	var ticketId int64
	sqlStatementTicket := `
	INSERT INTO
		bookings.tickets (travel_id, user_id, booking_code)
	VALUES
		($1, $2, $3)
	RETURNING ticket_id
	`

	err = tx.QueryRowContext(ctx, sqlStatementTicket, booking.TravelId, 1, bookingCode).Scan(&ticketId)

	if err != nil {
		if rbErr := tx.Rollback(); rbErr != nil {
			return fmt.Errorf("tx err: %v, rb err: %v", err, rbErr)
		}
		return err
	}

	if err != nil {
		if rbErr := tx.Rollback(); rbErr != nil {
			return fmt.Errorf("tx err: %v, rb err: %v", err, rbErr)
		}
		return err
	}
	// Assign Passengers
	sqlStatementPassengers := `
	INSERT INTO
		bookings.passengers (
			passenger_name,
			passenger_id_type,
			passenger_id_number,
			ticket_id,
			seat_id
		)
	VALUES
		($1, $2, $3, $4, $5)
	`

	for _, passenger := range booking.PassengerDetails {
		tx.ExecContext(
			ctx,
			sqlStatementPassengers,
			passenger.PassengerName,
			1,
			passenger.PassengerIdNumber,
			ticketId,
			passenger.SeatId,
		)
		if err != nil {
			if rbErr := tx.Rollback(); rbErr != nil {
				return fmt.Errorf("tx err: %v, rb err: %v", err, rbErr)
			}
			return err
		}
	}
	return tx.Commit()

}
