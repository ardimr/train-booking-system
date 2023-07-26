package repository

import (
	"context"
	"encoding/json"

	"github.com/ardimr/train-booking-system/internal/model"
)

func (q *PostgresRepository) GetUserTickets(ctx context.Context, param model.GetUserTicketsRequestParam) ([]model.UserTicket, error) {
	var userTickets []model.UserTicket

	queryStatement := `
	WITH user_tickets AS (
		SELECT
			users.user_id,
			tickets.ticket_id,
			travels.travel_code,
			json_build_object(
				'code',
				departure_station.station_code,
				'name',
				departure_station.name
			) AS departure_station,
			json_build_object(
				'code',
				destination_station.station_code,
				'name',
				destination_station.name
			) AS destination_station,
			travels.departure_schedule,
			travels.arrival_schedule,
			json_build_object(
				'hour',
					EXTRACT (
					HOUR
					FROM
						(
							travels.arrival_schedule - travels.departure_schedule
						)
				),
				'minute',
				EXTRACT (
					MINUTE
					FROM
						(
							travels.arrival_schedule - travels.departure_schedule
						)
				)
			) AS duration
		FROM
			bookings.tickets
			INNER JOIN users.users ON users.user_id = tickets.user_id
			INNER JOIN travel_schedules.travels ON travels.travel_id = tickets.travel_id
			INNER JOIN travel_schedules.stations departure_station ON departure_station.station_code = travels.departure_station
			INNER JOIN travel_schedules.stations destination_station ON destination_station.station_code = travels.destination_station
	)
	SELECT
		*
	FROM
		user_tickets
	WHERE user_id = $1
	`
	rows, err := q.db.QueryContext(ctx, queryStatement, param.UserId)

	if err != nil {
		return nil, err
	}

	for rows.Next() {
		var userTicket model.UserTicket
		var departureStationRaw []byte
		var destinationStationRaw []byte
		var durationRaw []byte

		rows.Scan(
			&userTicket.UserId,
			&userTicket.TicketId,
			&userTicket.TravelCode,
			&departureStationRaw,
			&destinationStationRaw,
			&userTicket.DepartureSchedule,
			&userTicket.ArrivalSchedule,
			&durationRaw,
		)

		if err = json.Unmarshal(departureStationRaw, &userTicket.DepartureStation); err != nil {
			return nil, err
		}

		if err = json.Unmarshal(destinationStationRaw, &userTicket.DestinationStation); err != nil {
			return nil, err
		}
		if err = json.Unmarshal(durationRaw, &userTicket.Duration); err != nil {
			return nil, err
		}

		userTickets = append(userTickets, userTicket)

	}

	return userTickets, nil
}
func (q *PostgresRepository) GetTicketDetailsById(ctx context.Context, param model.GetTicketDetailsRequestUri) (model.TicketDetails, error) {
	var ticketDetails model.TicketDetails
	queryStatement := `
	WITH travel_tickets AS (
		SELECT
			tickets.ticket_id,
			bookings.status,
			users.user_id,
			travels.travel_code,
			json_build_object(
				'code',
				departure_station.station_code,
				'name',
				departure_station.name
			) AS departure_station,
			json_build_object(
				'code',
				destination_station.station_code,
				'name',
				destination_station.name
			) AS destination_station,
			travels.departure_schedule,
			travels.arrival_schedule,
			json_build_object(
				'hour',
					EXTRACT (
					HOUR
					FROM
						(
							travels.arrival_schedule - travels.departure_schedule
						)
				),
				'minute',
				EXTRACT (
					MINUTE
					FROM
						(
							travels.arrival_schedule - travels.departure_schedule
						)
				)
			) AS duration
		FROM
			bookings.tickets
			INNER JOIN bookings.bookings ON bookings.booking_code = tickets.booking_code
			INNER JOIN users.users ON users.user_id = tickets.user_id
			INNER JOIN travel_schedules.travels ON travels.travel_id = tickets.travel_id
			INNER JOIN travel_schedules.stations departure_station ON departure_station.station_code = travels.departure_station
			INNER JOIN travel_schedules.stations destination_station ON destination_station.station_code = travels.destination_station
		WHERE tickets.ticket_id = $1
	),
	passenger_seats AS (
		SELECT
			passengers.ticket_id,
			passengers.passenger_id,
			seats.seat_id,
			classes.class_code || '-' || train_cars.train_car_no || '/' || seats.seat_row || seats.seat_column as seat_label
		FROM
			bookings.passengers
			INNER JOIN travel_schedules.seats on passengers.seat_id = seats.seat_id
			INNER JOIN travel_schedules.train_cars on train_cars.train_car_id = travel_schedules.seats.train_car_id
			INNER JOIN travel_schedules.classes on classes.id = train_cars.class_id
		WHERE
			passengers.ticket_id = $1
		ORDER BY
			passengers.passenger_id
	),
	ticket_passengers AS (
		SELECT
			tickets.ticket_id,
			json_agg(
				json_build_object (
					'passenger_id',
					passengers.passenger_id,
					'passenger_name',
					passengers.passenger_name,
					'passenger_id_type',
					id_types.name,
					'passenger_id_number',
					passengers.passenger_id_number,
					'seat_id',
					passenger_seats.seat_id,
					'seat_label',
					passenger_seats.seat_label
				)
			) AS passengers
		FROM
			bookings.passengers
			INNER JOIN bookings.tickets on tickets.ticket_id = passengers.ticket_id
			INNER JOIN users.id_types ON id_types.id_type_id = passengers.passenger_id_type
			INNER JOIN passenger_seats ON passenger_seats.ticket_id = tickets.ticket_id
			AND passengers.passenger_id = passenger_seats.passenger_id
		WHERE
			tickets.ticket_id = $1
		GROUP BY
			tickets.ticket_id
	),
	ticket_details AS (
		SELECT
			travel_tickets.ticket_id,
			travel_tickets.status,
			departure_station,
			destination_station,
			departure_schedule,
			arrival_schedule,
			duration,
			passengers
		FROM
			travel_tickets
			INNER JOIN ticket_passengers ON ticket_passengers.ticket_id = travel_tickets.ticket_id
	)
	SELECT
		*
	FROM
		ticket_details
	`
	var passengersRaw []byte
	var departureStationRaw []byte
	var destinationStationRaw []byte
	var durationRaw []byte

	err := q.db.QueryRowContext(ctx, queryStatement, param.TicketId).Scan(
		&ticketDetails.TicketId,
		&ticketDetails.Status,
		&departureStationRaw,
		&destinationStationRaw,
		&ticketDetails.DepartureSchedule,
		&ticketDetails.ArrivalSchedule,
		&durationRaw,
		&passengersRaw,
	)

	if err != nil {
		return ticketDetails, err
	}

	// Unmarshal PassengersRaw

	if err = json.Unmarshal(passengersRaw, &ticketDetails.Passengers); err != nil {
		return ticketDetails, err
	}

	if err = json.Unmarshal(departureStationRaw, &ticketDetails.DepartureStation); err != nil {
		return ticketDetails, err
	}

	if err = json.Unmarshal(destinationStationRaw, &ticketDetails.DestinationStation); err != nil {
		return ticketDetails, err
	}

	if err = json.Unmarshal(durationRaw, &ticketDetails.Duration); err != nil {
		return ticketDetails, err
	}

	return ticketDetails, nil
}
