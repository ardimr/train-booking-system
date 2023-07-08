package model

type AvailableSeat struct {
	WagonClass  string       `json:"wagon_class"`
	WagonNumber int64        `json:"wagon_number"`
	SeatingRows []SeatingRow `json:"seting_rows"`
}

type SeatingRow struct {
	RowElements []RowElement `json:"row_elements"`
}

type RowElement struct {
	SeatId     int64  `json:"seat_id"`
	SeatRow    int64  `json:"seat_row"`
	SeatColumn string `json:"seat_column"`
	SeatNo     string `json:"seat_label"`
	Available  bool   `json:"available"`
}
