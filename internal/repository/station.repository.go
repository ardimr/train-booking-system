package repository

import (
	"context"
	"database/sql"

	"github.com/ardimr/train-booking-system/internal/model"
)

func (q *PostgresRepository) FindStations(ctx context.Context, param model.StationRequestParam) ([]model.CityStation, error) {
	var cityStations []model.CityStation

	queryStatement := `
	WITH city_stations AS (
		SELECT
			cities.name as city_name,
			stations.station_code as code,
			stations.name as name,
			stations.station_code || ' - ' || stations.name as label
		FROM travel_schedules.stations
		INNER JOIN travel_schedules.cities
		ON stations.city_code=cities.city_code
	)
	
	SELECT * FROM city_stations
	WHERE code ILIKE $1 || '%' OR city_name ILIKE  $1 || '%'
	`

	// Querying
	rows, err := q.db.QueryContext(ctx, queryStatement, param.InputStation)

	if err != nil {
		return nil, err
	}

	for rows.Next() {
		var cityStation model.CityStation

		err := rows.Scan(
			&cityStation.CityName,
			&cityStation.Code,
			&cityStation.Name,
			&cityStation.Label,
		)

		if err != nil {
			return nil, err
		}

		cityStations = append(cityStations, cityStation)
	}

	return cityStations, nil
}

func (q *PostgresRepository) AddStation(ctx context.Context, newStation model.NewStation) error {

	insertStatement := `
	INSERT INTO
    travel_schedules.stations (station_code, name, city_code)
	VALUES
			($1, $2, $3) 
	`

	_, err := q.db.ExecContext(ctx, insertStatement, newStation.StationCode, newStation.Name, newStation.CityCode)

	if err != nil {
		return err
	}

	return nil
}

func (q *PostgresRepository) EditStation(ctx context.Context, stationCode string, newStation model.NewStation) error {

	updateStatement := `
	UPDATE 
		travel_schedules.stations 
	SET
		station_code = $2,
		name = $3, 
		city_code= $4
	WHERE 
		station_code = $1
	`

	res, err := q.db.ExecContext(ctx, updateStatement, stationCode, newStation.StationCode, newStation.Name, newStation.CityCode)

	if err != nil {
		return err
	}

	rows, _ := res.RowsAffected()
	if rows < 1 {
		return sql.ErrNoRows
	}
	return nil
}

func (q *PostgresRepository) DeleteStation(ctx context.Context, stationCode string) error {
	deleteStatement := `
	DELETE FROM
    travel_schedules.stations
	WHERE
			stations.station_code = $1
	`

	res, err := q.db.ExecContext(ctx, deleteStatement, stationCode)

	if err != nil {
		return err
	}

	rows, _ := res.RowsAffected()

	if rows < 1 {
		return sql.ErrNoRows
	}

	return nil
}
