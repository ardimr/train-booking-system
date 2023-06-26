package model

type TravelScheduleReqParam struct {
	// DepartureCityCode      string `form:"departure_city_code,omitempty"`
	// DestinationCityCode    string `form:"destination_city_code,omitempty"`
	DepartureStationCode   string `form:"departure_station_code"`
	DestinationStationCode string `form:"destination_station_code"`
	DepartureDate          string `form:"departure_date"`
}
