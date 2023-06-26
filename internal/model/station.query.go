package model

type Station struct {
	StationCode string `json:"station_code"`
	Name        string `json:"name"`
	CityCode    string `json:"city_code"`
}

type CityStation struct {
	CityName    string `json:"city_name"`
	StationCode string `json:"station_code"`
	StationName string `json:"station_name"`
}
