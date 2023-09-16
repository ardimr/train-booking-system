package seat

import (
	"github.com/ardimr/train-booking-system/internal/station/controller"
	"github.com/gin-gonic/gin"
)

type StationRouter struct {
	controller *controller.StationController
}

func NewStationRouter(controller *controller.StationController) *StationRouter {
	return &StationRouter{
		controller: controller,
	}
}

func (router *StationRouter) RegisterRoute(superRoute *gin.RouterGroup) {
	stationRouter := superRoute.Group("/v1")
	stationRouter.GET("/stations", router.controller.FindStations)
	stationRouter.POST("/stations", router.controller.AddStation)
	stationRouter.PATCH("/stations/:station_code", router.controller.EditStation)
	stationRouter.DELETE("/stations/:station_code", router.controller.DeleteStation)
}
