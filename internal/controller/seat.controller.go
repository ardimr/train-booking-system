package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/model"
	"github.com/gin-gonic/gin"
)

func (controller *Controller) FindAvailableSeats(ctx *gin.Context) {
	// Retrieve the request parameter in query
	var reqParam model.AvailableSeatRequestParam

	if err := ctx.BindQuery(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusBadRequest,
			gin.H{"Error": err.Error()},
		)
	}

	// Get the stations data from database
	availableSeats, err := controller.querier.FindAvailableSeats(ctx, reqParam)

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
