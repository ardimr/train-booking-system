package repository

import (
	"context"

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
