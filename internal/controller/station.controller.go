package controller

import (
	"database/sql"
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

func (controller *Controller) AddStation(ctx *gin.Context) {
	var reqBody model.NewStation

	if err := ctx.BindJSON(&reqBody); err != nil {
		ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"Error": err.Error()})
		return
	}

	err := controller.querier.AddStation(ctx, reqBody)

	if err != nil {
		if err := ctx.BindJSON(&reqBody); err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"Error": err.Error()})
			return
		}
	}

	ctx.Status(http.StatusAccepted)
}

func (controller *Controller) EditStation(ctx *gin.Context) {
	var reqUri model.StationReqUri
	var newStation model.NewStation

	if err := ctx.BindUri(&reqUri); err != nil {
		ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"Error": err.Error()})
		return
	}

	if err := ctx.BindJSON(&newStation); err != nil {
		ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"Error": err.Error()})
		return
	}

	err := controller.querier.EditStation(ctx, reqUri.StationCode, newStation)
	if err != nil {
		switch err {
		case sql.ErrNoRows:
			ctx.AbortWithStatusJSON(http.StatusNotFound, gin.H{"Error": "Station not found"})
			return
		default:
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"Error": err.Error()})
			return
		}
	}
	ctx.Status(http.StatusAccepted)
}

func (controller *Controller) DeleteStation(ctx *gin.Context) {
	var reqUri model.StationReqUri

	if err := ctx.BindUri(&reqUri); err != nil {
		ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"Error": err.Error()})
		return
	}

	err := controller.querier.DeleteStation(ctx, reqUri.StationCode)
	if err != nil {
		switch err {
		case sql.ErrNoRows:
			ctx.AbortWithStatusJSON(http.StatusNotFound, gin.H{"Error": "Station not found"})
			return
		default:
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"Error": err.Error()})
			return
		}
	}
	ctx.Status(http.StatusNoContent)
}
