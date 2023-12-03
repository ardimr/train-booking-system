package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/exception"
	"github.com/ardimr/train-booking-system/internal/station/model"
	"github.com/ardimr/train-booking-system/internal/station/usecase"
	"github.com/gin-gonic/gin"
)

type StationController struct {
	stationUseCase usecase.IStationUseCase
}

func NewStationController(stationUseCase usecase.IStationUseCase) *StationController {
	return &StationController{
		stationUseCase: stationUseCase,
	}
}

func (controller *StationController) FindStations(ctx *gin.Context) {
	// Retrieve the request parameter in query
	var reqParam model.StationRequestParam

	if err := ctx.ShouldBindQuery(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	// Get the stations data from database
	cityCtations, err := controller.stationUseCase.GetStations(ctx, reqParam)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.JSON(
		http.StatusOK,
		cityCtations,
	)
}

func (controller *StationController) AddStation(ctx *gin.Context) {
	var reqBody model.NewStation

	if err := ctx.ShouldBindJSON(&reqBody); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	err := controller.stationUseCase.AddStation(ctx, reqBody)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.Status(http.StatusAccepted)
}

func (controller *StationController) EditStation(ctx *gin.Context) {
	var reqUri model.StationReqUri
	var newStation model.NewStation

	if err := ctx.ShouldBindUri(&reqUri); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	if err := ctx.ShouldBindJSON(&newStation); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	err := controller.stationUseCase.EditStation(ctx, reqUri.StationCode, newStation)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}
	ctx.Status(http.StatusAccepted)
}

func (controller *StationController) DeleteStation(ctx *gin.Context) {
	var reqUri model.StationReqUri

	if err := ctx.ShouldBindUri(&reqUri); err != nil {
		ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"Error": err.Error()})
		return
	}

	err := controller.stationUseCase.DeleteStation(ctx, reqUri.StationCode)
	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}
	ctx.Status(http.StatusNoContent)
}
