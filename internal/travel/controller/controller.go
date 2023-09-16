package controller

import (
	"database/sql"
	"net/http"

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
		ctx.JSON(
			http.StatusInternalServerError,
			gin.H{
				"Message": err.Error(),
			},
		)
		return
	}

	// Get users data from db
	users, err := controller.travelUseCase.ListTravels(ctx, reqParam)
	if err != nil {
		ctx.JSON(
			http.StatusInternalServerError,
			gin.H{
				"Message": err.Error(),
			},
		)
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
	if err := ctx.BindUri(&reqUri); err != nil {
		ctx.JSON(
			http.StatusBadRequest,
			gin.H{
				"message": err.Error(),
			},
		)
		return
	}

	if err := ctx.BindQuery(&reqParam); err != nil {
		ctx.JSON(
			http.StatusBadRequest,
			gin.H{
				"message": err.Error(),
			},
		)
		return
	}

	user, err := controller.travelUseCase.GetTravelById(ctx, reqUri.TravelId, reqParam.WagonClass)

	if err != nil {
		switch err {
		case sql.ErrNoRows:
			ctx.AbortWithStatusJSON(
				http.StatusNotFound,
				gin.H{
					"Message": "Not Found",
				},
			)
		}
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
		ctx.JSON(
			http.StatusBadRequest,
			gin.H{
				"Message": err.Error(),
			},
		)
		return
	}

	newId, err := controler.travelUseCase.AddNewTravel(ctx, newTravel)

	if err != nil {
		ctx.JSON(
			http.StatusInternalServerError,
			gin.H{
				"Message": err.Error(),
			},
		)

		return
	}

	ctx.JSON(
		http.StatusOK,
		gin.H{
			"New Id": newId,
		},
	)
}
