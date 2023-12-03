package seat

import (
	"github.com/ardimr/train-booking-system/internal/auth"
	"github.com/ardimr/train-booking-system/internal/middleware"
	"github.com/ardimr/train-booking-system/internal/station/controller"
	"github.com/gin-gonic/gin"
)

type StationRouter struct {
	controller *controller.StationController
	auth       *auth.AuthService
}

func NewStationRouter(controller *controller.StationController, auth *auth.AuthService) *StationRouter {
	return &StationRouter{
		controller: controller,
		auth:       auth,
	}
}

func (router *StationRouter) RegisterRoute(superRoute *gin.RouterGroup) {
	stationRouter := superRoute.Group("/v1")
	stationRouter.GET("/stations", router.controller.FindStations)
	stationRouter.POST("/stations", middleware.ValidateToken(router.auth), middleware.SetUserPermission(router.auth), middleware.UserHasPermission(router.auth), router.controller.AddStation)
	stationRouter.PATCH("/stations/:station_code", middleware.ValidateToken(router.auth), middleware.SetUserPermission(router.auth), middleware.UserHasPermission(router.auth), router.controller.EditStation)
	stationRouter.DELETE("/stations/:station_code", middleware.ValidateToken(router.auth), middleware.SetUserPermission(router.auth), middleware.UserHasPermission(router.auth), router.controller.DeleteStation)
}
