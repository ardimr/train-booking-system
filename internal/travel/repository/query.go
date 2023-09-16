package repository

const (
	listTravelsStatement = `
WITH available_travel_seats AS (
		SELECT
			travels.travel_id,
			seats.seat_id,
			classes.id AS class_id
		FROM
			travel_schedules.seats
			INNER JOIN travel_schedules.train_cars ON train_cars.train_car_id = seats.train_car_id
			INNER JOIN travel_schedules.classes ON classes.id = train_cars.class_id
			INNER JOIN travel_schedules.trains ON trains.train_code = train_cars.train_code
			INNER JOIN travel_schedules.travels ON travels.train_code = trains.train_code
	),
	travel_tickets AS (
		SELECT
			travel_id,
			passengers.seat_id
		FROM
			bookings.tickets
			INNER JOIN bookings.passengers ON passengers.ticket_id = tickets.ticket_id
	),
	num_available_seats AS (
		SELECT
			available_travel_seats.travel_id,
			available_travel_seats.class_id,
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
			classes.class_code as wagon_class_code,
			classes.name as wagon_class_name,
			json_build_object('code', departure_station.station_code, 'name', departure_station.name) AS departure_station,
			json_build_object('code', destination_station.station_code, 'name', destination_station.name) AS destination_station,
			travels.departure_schedule,
			travels.arrival_schedule,
			json_build_object (
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
			) AS duration,
			json_build_object('currency', travel_fares.currency_code, 'amount', travel_fares.fare) AS fare,
			num_available_seats.available_seats
		FROM
			travel_schedules.travels
			INNER JOIN travel_schedules.stations departure_station ON departure_station.station_code = travels.departure_station -- join table for departure station
			INNER JOIN travel_schedules.stations destination_station ON destination_station.station_code = travels.destination_station -- join table for destination station
			INNER JOIN travel_schedules.trains ON travel_schedules.travels.train_code = travel_schedules.trains.train_code -- join table for train information
			INNER JOIN travel_schedules.travel_fares ON travel_fares.travel_id = travels.travel_id -- join table for travel costs
			INNER JOIN num_available_seats ON num_available_seats.travel_id = travels.travel_id -- join table for available seats
			AND num_available_seats.class_id = travel_fares.class_id
			INNER JOIN travel_schedules.classes ON classes.id = travel_fares.class_id -- join table for the travel class
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

	getTravelByIdStatement = `
	SELECT
    travels.travel_id,
    travels.travel_code,
		trains.train_code as train_code,
    trains.name as train_name,
    json_build_object('wagon_class_code', classes.class_code, 'wagon_class_name', classes.name) AS wagon_class,
    travels.departure_schedule,
    travels.arrival_schedule,
    json_build_object(
        'city_code',
        dep_station.city_code,
        'name',
        dep_station.name,
        'code',
        dep_station.station_code
    ) AS departure_station,
    json_build_object(
        'city_code',
        dest_station.city_code,
        'name',
        dest_station.name,
        'code',
        dest_station.station_code
    ) AS destination_station,
    json_build_object (
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
    ) AS duration,
    json_build_object('currency', travel_fares.currency_code, 'amount', travel_fares.fare) AS fare

	FROM
			travel_schedules.travels 
			INNER JOIN travel_schedules.stations dep_station ON dep_station.station_code = travels.departure_station
			INNER JOIN travel_schedules.stations dest_station ON dest_station.station_code = travels.destination_station
			INNER JOIN travel_schedules.trains on trains.train_code = travels.train_code
			INNER JOIN travel_schedules.travel_fares ON travel_fares.travel_id = travels.travel_id
			INNER JOIN travel_schedules.classes ON travel_fares.class_id = classes.id
	WHERE
			travels.travel_id = $1 AND classes.class_code = $2
	`

	addTravelStatement = `
	INSERT INTO
	    travel_schedules.travels (
	        travel_code,
	        departure_schedule,
	        arrival_schedule,
	        departure_station,
	        destination_station,
	        train_code
	    )
	VALUES
	    (
	        $1,
	        $2,
	        $3,
	        $4,
	        $5,
	        $6
	    )
	RETURNING travel_id
	`
	addFareStatement = `
	INSERT INTO
	travel_schedules.travel_fares (
			travel_id,
			class_id,
			fare,
			currency_code
		)
	VALUES
		(
				$1,
				$2,
				$3,
				$4
		)
	`
)
