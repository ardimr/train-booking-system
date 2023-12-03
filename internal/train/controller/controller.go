package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/exception"
	"github.com/ardimr/train-booking-system/internal/train/model"
	"github.com/ardimr/train-booking-system/internal/train/usecase"
	"github.com/gin-gonic/gin"
)

type TrainController struct {
	trainUseCase usecase.ITrainUseCase
}

func NewTrainController(trainUseCase usecase.ITrainUseCase) *TrainController {
	return &TrainController{
		trainUseCase: trainUseCase,
	}
}

func (controller *TrainController) ListTrains(ctx *gin.Context) {

	var trains []model.Train
	var reqParam model.RequestParam

	if err := ctx.ShouldBindQuery(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
	}

	trains, err := controller.trainUseCase.ListTrains(ctx, reqParam)
	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
	}

	ctx.JSON(http.StatusOK, trains)
}

func (controller *TrainController) GetTrain(ctx *gin.Context) {

	var trains model.Train
	var reqUri model.ReqestUri

	if err := ctx.ShouldBindUri(&reqUri); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	trains, err := controller.trainUseCase.GetTrainByCode(ctx, reqUri.TrainCode)
	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.JSON(http.StatusOK, trains)
}

func (controller *TrainController) AddNewTrain(ctx *gin.Context) {

	var newTrain model.Train

	if err := controller.trainUseCase.AddNewTrain(ctx, newTrain); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.Status(http.StatusAccepted)
}

func (controller *TrainController) EditTrain(ctx *gin.Context) {

	var newTrain model.Train
	var reqUri model.ReqestUri

	if err := ctx.ShouldBindUri(&reqUri); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	if err := ctx.ShouldBindJSON(&newTrain); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	if err := controller.trainUseCase.EditTrain(ctx, reqUri.TrainCode, newTrain); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.Status(http.StatusAccepted)
}

func (controller *TrainController) DeleteTrain(ctx *gin.Context) {

	var reqUri model.ReqestUri

	if err := ctx.ShouldBindUri(&reqUri); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	if err := controller.trainUseCase.DeleteTrain(ctx, reqUri.TrainCode); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.Status(http.StatusAccepted)
}
