package controller

import (
	"database/sql"
	"net/http"

	"github.com/ardimr/train-booking-system/internal/model"
	"github.com/ardimr/train-booking-system/internal/repository"

	"github.com/gin-gonic/gin"
)

type Controller struct {
	querier repository.Repository
}

func NewController(q repository.Repository) *Controller {
	return &Controller{
		querier: q,
	}
}

// Controller Implementation

func (controller *Controller) ListTravels(ctx *gin.Context) {
	// Retrieve the request parameters
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
	users, err := controller.querier.ListTravels(ctx, reqParam)
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

func (controller *Controller) GetTravelById(ctx *gin.Context) {
	var reqUri model.GetUserByIdReqUri

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

	user, err := controller.querier.GetTravelById(ctx, reqUri.ID)

	if err != nil {
		switch err {
		case sql.ErrNoRows:
			ctx.JSON(
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

func (controler *Controller) AddNewTravel(ctx *gin.Context) {
	var newTravel model.Travel

	if err := ctx.BindJSON(&newTravel); err != nil {
		ctx.JSON(
			http.StatusBadRequest,
			gin.H{
				"Message": err.Error(),
			},
		)
		return
	}

	newId, err := controler.querier.AddNewTravel(ctx, newTravel)

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

func (controller *Controller) UpdateTravelById(ctx *gin.Context) {
	var travel model.Travel

	if err := ctx.BindJSON(&travel); err != nil {
		ctx.JSON(
			http.StatusBadRequest,
			gin.H{
				"Message": err.Error(),
			},
		)
		return
	}

	res, err := controller.querier.UpdateTravelById(ctx, 1, travel)

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
			"Rows affected": res,
		},
	)
}

func (controller *Controller) DeleteTravel(ctx *gin.Context) {
	var reqUri model.DeleteUserReqUri

	if err := ctx.BindUri(&reqUri); err != nil {
		ctx.JSON(
			http.StatusBadRequest,
			gin.H{
				"Message": err.Error(),
			},
		)
		return
	}

	if err := controller.querier.DeleteTravel(ctx, reqUri.ID); err != nil {
		ctx.JSON(
			http.StatusInternalServerError,
			gin.H{
				"Message": err.Error(),
			},
		)
	}

	ctx.Status(
		http.StatusOK,
	)
}
