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

	ctx.JSON(
		http.StatusAccepted,
		reqBody,
	)
}
