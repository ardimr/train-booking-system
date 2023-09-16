package seat

import (
	"github.com/ardimr/train-booking-system/internal/seat/controller"
	"github.com/gin-gonic/gin"
)

type SeatRouter struct {
	controller *controller.SeatController
}

func NewSeatRouter(controller *controller.SeatController) *SeatRouter {
	return &SeatRouter{
		controller: controller,
	}
}

func (router *SeatRouter) RegisterRoute(superRoute *gin.RouterGroup) {
	seatRouter := superRoute.Group("/v1")
	seatRouter.GET("/seats", router.controller.FindAvailableSeats)
}
