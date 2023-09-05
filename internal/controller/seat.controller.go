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
		return
	}

	// Get the stations data from database
	availableSeats, err := controller.querier.FindAvailableSeats(ctx, reqParam)

	if err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusInternalServerError,
			gin.H{"Error": err.Error()},
		)
		return
	}

	if len(availableSeats) == 0 {
		ctx.AbortWithStatusJSON(
			http.StatusNotFound,
			gin.H{"Error": "No Content"},
		)
		return
	}

	// Check in redis for any booked seats
	bookedSeats, err := controller.redis.GetBookedSeats(ctx, reqParam.TravelId)

	for _, bookedSeat := range bookedSeats {
		// Overide the avaiability status
		for wagonIdx, wagon := range availableSeats {
			for rowIdx, row := range wagon.SeatingRows {
				for seatIdx, seat := range row.RowElements {
					if bookedSeat == seat.SeatId {
						availableSeats[wagonIdx].SeatingRows[rowIdx].RowElements[seatIdx].Available = false
					}
				}
			}
		}
	}

	if err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusInternalServerError,
			gin.H{"Error": err.Error()},
		)
		return
	}
	ctx.JSON(
		http.StatusOK,
		availableSeats,
	)
}
