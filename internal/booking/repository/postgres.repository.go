package repository

import (
	"context"
	"database/sql"
	"fmt"

	"github.com/ardimr/train-booking-system/configs/db"
	"github.com/ardimr/train-booking-system/internal/booking/model"
)

type IBookingRepository interface {
	CreateBooking(ctx context.Context, booking model.BookingDetails) error
	UpdateBookingStatus(ctx context.Context, bookingCode string) error
}

type BookingRepository struct {
	db db.DBInterface
}

func NewBookingRepository(db db.DBInterface) *BookingRepository {
	return &BookingRepository{
		db: db,
	}
}

func (q *BookingRepository) CreateBooking(ctx context.Context, booking model.BookingDetails) error {

	tx, err := q.db.BeginTx(ctx, &sql.TxOptions{})

	if err != nil {
		return err
	}

	// Store Booking into db
	sqlStatementBooking := `
	INSERT INTO
		bookings.bookings (booking_code, status, total_amount)
	VALUES
		($1, 'WAITING', $2)
	`
	_, err = tx.ExecContext(ctx, sqlStatementBooking, booking.BookingCode, 150000)

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

	err = tx.QueryRowContext(ctx, sqlStatementTicket, booking.TravelId, booking.UserId, booking.BookingCode).Scan(&ticketId)

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

func (q *BookingRepository) UpdateBookingStatus(ctx context.Context, bookingCode string) error {
	sqlStatement := `
		UPDATE
			bookings.bookings
		SET
			status = 'PAID'
		WHERE
			bookings.booking_code = $1
	`

	res, err := q.db.ExecContext(ctx, sqlStatement, bookingCode)

	if err != nil {
		return err
	}

	rows, err := res.RowsAffected()
	if err != nil {
		return err
	}

	if rows == 0 {
		return sql.ErrNoRows
	}

	return nil
}
