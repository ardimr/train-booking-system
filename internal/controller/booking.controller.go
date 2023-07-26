package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/model"
	"github.com/gin-gonic/gin"
)

func (controller *Controller) NewBooking(ctx *gin.Context) {

	var reqBody model.BookingRequestBody

	if err := ctx.BindJSON(&reqBody); err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusBadRequest,
			gin.H{"Err": err.Error()},
		)
		return
	}

	// Set to redis
	bookingCode, err := controller.redis.CreateBooking(ctx, reqBody)
	if err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusInternalServerError,
			gin.H{"Err": err.Error()},
		)
		return
	}

	// The following process is proceed with assumptions the payment is success
	err = controller.querier.CreateBooking(ctx, bookingCode, reqBody)
	if err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusInternalServerError,
			gin.H{"Err": err.Error()},
		)
		return
	}
	ctx.JSON(
		http.StatusAccepted,
		gin.H{"Booking code": bookingCode},
	)
}
