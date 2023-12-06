package repository

const (
	GetTrainsStatement = `
	WITH train_wagons as(
    SELECT
        trains.train_code,
        json_agg(
            json_build_object(
                'wagon_id',
                train_cars.train_car_id,
                'class_id',
                train_cars.class_id,
                'wagon_number',
                train_cars.train_car_no,
								'capacity',
								train_cars.capacity
            )
        ) as wagons
    FROM
        travel_schedules.trains
        INNER JOIN travel_schedules.train_cars ON train_cars.train_code = trains.train_code
    GROUP BY
        trains.train_code
	)
	SELECT
			trains.train_code,
			trains.name,
			train_wagons.wagons
	FROM
			travel_schedules.trains
			INNER JOIN train_wagons ON train_wagons.train_code = trains.train_code
	`
	GetTrainByCodeStatement = `
	WITH train_wagons as(
    SELECT
        trains.train_code,
        json_agg(
            json_build_object(
                'wagon_id',
                train_cars.train_car_id,
                'class_id',
                train_cars.class_id,
                'wagon_number',
                train_cars.train_car_no,
								'capacity',
								train_cars.capacity
            )
        ) as wagons
    FROM
        travel_schedules.trains
        INNER JOIN travel_schedules.train_cars ON train_cars.train_code = trains.train_code
    GROUP BY
        trains.train_code
	)
	SELECT
			trains.train_code,
			trains.name,
			train_wagons.wagons
	FROM
			travel_schedules.trains
			INNER JOIN train_wagons ON train_wagons.train_code = trains.train_code
	WHERE trains.train_code = $1
	`
)
