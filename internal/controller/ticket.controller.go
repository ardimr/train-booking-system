package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/model"
	"github.com/gin-gonic/gin"
)

func (controller *Controller) GetUserTickets(ctx *gin.Context) {
	// Retrieve the request parameter in query
	var reqParam model.GetUserTicketsRequestParam
	if err := ctx.BindQuery(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusBadRequest,
			gin.H{"Error": err.Error()},
		)
		return
	}
	// Get the stations data from database
	userTickets, err := controller.querier.GetUserTickets(ctx, reqParam)

	if err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusInternalServerError,
			gin.H{"Error": err.Error()},
		)
		return
	}

	ctx.JSON(
		http.StatusOK,
		userTickets,
	)
}

func (controller *Controller) GetTicketDetailsById(ctx *gin.Context) {
	// Retrieve the request parameter in query
	var reqParam model.GetTicketDetailsRequestUri
	if err := ctx.BindUri(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusBadRequest,
			gin.H{"Error": err.Error()},
		)
		return
	}

	// Get the stations data from database
	ticketDetails, err := controller.querier.GetTicketDetailsById(ctx, reqParam)

	if err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusInternalServerError,
			gin.H{"Error": err.Error()},
		)
		return
	}

	ctx.JSON(
		http.StatusOK,
		ticketDetails,
	)
}
