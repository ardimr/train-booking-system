package model

type StationRequestParam struct {
	InputStation string `form:"input_station"`
}

type StationReqUri struct {
	StationCode string `uri:"station_code"`
}
type NewStation struct {
	StationCode string `json:"station_code"`
	Name        string `json:"name"`
	CityCode    string `json:"city_code"`
}
