package seat

import (
	"github.com/ardimr/train-booking-system/internal/ticket/controller"
	"github.com/gin-gonic/gin"
)

type TicketRouter struct {
	ticketController *controller.TicketController
}

func NewTicketRouter(ticketController *controller.TicketController) *TicketRouter {
	return &TicketRouter{
		ticketController: ticketController,
	}
}

func (router *TicketRouter) RegisterRoute(superRoute *gin.RouterGroup) {
	ticketRouter := superRoute.Group("/v1")
	ticketRouter.GET("/tickets", router.ticketController.GetUserTickets)
	ticketRouter.GET("/tickets/:ticket_id", router.ticketController.GetTicketDetailsById)
}
