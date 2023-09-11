package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/model"
	"github.com/gin-gonic/gin"
)

func (controller *Controller) AddNewWagon(ctx *gin.Context) {
	var newWagon model.NewWagon

	if err := ctx.BindJSON(&newWagon); err != nil {
		ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"Error": err.Error()})
		return
	}

	seatRows := newWagon.Capacity / 4
	err := controller.querier.AddSeats(ctx, newWagon.WagonId, seatRows)

	if err != nil {
		ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"Error": err.Error()})
		return
	}
}
