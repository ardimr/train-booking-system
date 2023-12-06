package repository

const (
	AddTrainStatement = `
	INSERT INTO 
		travel_schedules.trains (
			train_code, name
		) 
		VALUES 
			($1, $2)
	`
	AddWagonStatement = `
	INSERT INTO
    travel_schedules.train_cars(
        train_code,
        capacity,
        class_id,
        train_car_no
    )
		VALUES
			($1, $2, $3, $4)

	RETURNING train_car_id
	`

	AddSeatStatement = `
	INSERT INTO 
		travel_schedules.seats (
			seat_row,
			seat_column,
			train_car_id
		) 
		VALUES %s
	`
)
