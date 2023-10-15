package ticket

import (
	"github.com/ardimr/train-booking-system/internal/auth"
	"github.com/ardimr/train-booking-system/internal/middleware"
	"github.com/ardimr/train-booking-system/internal/ticket/controller"
	"github.com/gin-gonic/gin"
)

type TicketRouter struct {
	ticketController *controller.TicketController
	auth             *auth.AuthService
}

func NewTicketRouter(ticketController *controller.TicketController, auth *auth.AuthService) *TicketRouter {
	return &TicketRouter{
		ticketController: ticketController,
		auth:             auth,
	}
}

func (router *TicketRouter) RegisterRoute(superRoute *gin.RouterGroup) {
	ticketRouter := superRoute.Group("/v1")
	ticketRouter.GET("/tickets", middleware.ValidateToken(router.auth), router.ticketController.GetUserTickets)
	ticketRouter.GET("/tickets/:ticket_id", middleware.ValidateToken(router.auth), router.ticketController.GetTicketDetailsById)
}
