package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/seat/model"
	"github.com/ardimr/train-booking-system/internal/seat/usecase"
	"github.com/gin-gonic/gin"
)

type SeatController struct {
	seatUseCase usecase.ISeatUseCase
}

func NewSeatController(seatUseCase usecase.ISeatUseCase) *SeatController {
	return &SeatController{
		seatUseCase: seatUseCase,
	}
}

func (controller *SeatController) FindAvailableSeats(ctx *gin.Context) {
	// Retrieve the request parameter in query
	var reqParam model.AvailableSeatRequestParam

	if err := ctx.BindQuery(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusBadRequest,
			gin.H{"Error": err.Error()},
		)
		return
	}

	availableSeats, err := controller.seatUseCase.FindAvailableSeats(ctx, reqParam)

	if err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusInternalServerError,
			gin.H{"Error": err.Error()},
		)
	}

	ctx.JSON(
		http.StatusOK,
		availableSeats,
	)
}
