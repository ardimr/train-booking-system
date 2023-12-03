package repository

const (
	AddTrain = `
	INSERT INTO 
		travel_schedules.trains (
			train_code, name
		) 
		VALUES 
			($1, $2)
	`
	AddWagon = `
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
)
