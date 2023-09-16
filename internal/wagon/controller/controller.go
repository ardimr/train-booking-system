package controller

import (
	"github.com/ardimr/train-booking-system/internal/wagon/usecase"
)

type WagonController struct {
	wagonUseCase usecase.IWagonUseCase
}

func NewWagonController(wagonUseCase usecase.IWagonUseCase) *WagonController {
	return &WagonController{
		wagonUseCase: wagonUseCase,
	}
}
