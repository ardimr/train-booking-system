package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/exception"
	"github.com/ardimr/train-booking-system/internal/ticket/model"
	"github.com/ardimr/train-booking-system/internal/ticket/usecase"
	"github.com/gin-gonic/gin"
)

type TicketController struct {
	ticketUseCase usecase.ITicketUseCase
}

func NewTicketController(ticketUseCase usecase.ITicketUseCase) *TicketController {
	return &TicketController{
		ticketUseCase: ticketUseCase,
	}
}

func (controller *TicketController) GetUserTickets(ctx *gin.Context) {
	// Retrieve the request parameter in query
	var reqParam model.TicketRequestParam
	if err := ctx.BindQuery(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}
	// Get the stations data from database
	userTickets, err := controller.ticketUseCase.GetUserTickets(ctx, reqParam)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.JSON(
		http.StatusOK,
		userTickets,
	)
}

func (controller *TicketController) GetTicketDetailsById(ctx *gin.Context) {
	// Retrieve the request parameter in query
	var reqParam model.TicketRequestUri
	if err := ctx.BindUri(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	// Get the stations data from database
	ticketDetails, err := controller.ticketUseCase.GetTicketDetailsById(ctx, reqParam)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.JSON(
		http.StatusOK,
		ticketDetails,
	)
}
