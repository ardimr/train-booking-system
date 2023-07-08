package model

type Station struct {
	Code string `json:"code"`
	Name string `json:"name"`
	// CityCode string `json:"city_code"`
}

type CityStation struct {
	CityName string `json:"city_name"`
	Code     string `json:"code"`
	Name     string `json:"name"`
	Label    string `json:"label"`
}
