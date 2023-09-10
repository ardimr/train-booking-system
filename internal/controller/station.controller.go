package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/model"
	"github.com/gin-gonic/gin"
)

func (controller *Controller) FindStations(ctx *gin.Context) {
	// Retrieve the request parameter in query
	var reqParam model.StationRequestParam

	if err := ctx.BindQuery(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusBadRequest,
			gin.H{"Error": err.Error()},
		)
	}

	// Get the stations data from database
	cityCtations, err := controller.querier.FindStations(ctx, reqParam)

	if err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusInternalServerError,
			gin.H{"Error": err.Error()},
		)
	}

	ctx.JSON(
		http.StatusOK,
		cityCtations,
	)
}

func (controller *Controller) AddStation(ctx *gin.Context) {}

func (controller *Controller) EditStation(ctx *gin.Context) {}

func (controller *Controller) DeleteStation(ctx *gin.Context) {}
