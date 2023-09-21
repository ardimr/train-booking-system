package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/exception"
	"github.com/ardimr/train-booking-system/internal/travel/model"
	"github.com/ardimr/train-booking-system/internal/travel/usecase"
	"github.com/gin-gonic/gin"
)

type TravelController struct {
	travelUseCase usecase.ITravelUseCase
}

func NewTravelController(travelUseCase usecase.ITravelUseCase) *TravelController {
	return &TravelController{
		travelUseCase: travelUseCase,
	}
}

func (controller *TravelController) ListTravels(ctx *gin.Context) {
	var reqParam model.TravelScheduleReqParam

	if err := ctx.BindQuery(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	// Get users data from db
	users, err := controller.travelUseCase.ListTravels(ctx, reqParam)
	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.JSON(
		http.StatusOK,
		users,
	)
}

func (controller *TravelController) GetTravelById(ctx *gin.Context) {
	var reqUri model.TravelReqUri
	var reqParam model.TravelReqParam

	// Request URI Binding
	if err := ctx.ShouldBindUri(&reqUri); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	if err := ctx.ShouldBindQuery(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	user, err := controller.travelUseCase.GetTravelById(ctx, reqUri.TravelId, reqParam.WagonClass)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	// Success state
	ctx.JSON(
		http.StatusOK,
		user,
	)
}

func (controler *TravelController) AddNewTravel(ctx *gin.Context) {
	var newTravel model.AddNewTravel

	if err := ctx.BindJSON(&newTravel); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	newId, err := controler.travelUseCase.AddNewTravel(ctx, newTravel)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.JSON(
		http.StatusOK,
		gin.H{
			"New Id": newId,
		},
	)
}
