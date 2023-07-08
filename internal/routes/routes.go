package router

import (
	"github.com/ardimr/train-booking-system/internal/controller"

	"github.com/gin-gonic/gin"
)

type Router struct {
	controller *controller.Controller
}

func NewRouter(controller *controller.Controller) *Router {
	return &Router{
		controller: controller,
	}
}

func (router *Router) AddRoute(superRoute *gin.RouterGroup) {
	router.travelRoutes(superRoute)
	router.stationRoutes(superRoute)
	router.seatRoutes(superRoute)
}

func (router *Router) travelRoutes(superRoute *gin.RouterGroup) {
	userRouter := superRoute.Group("/v1")
	userRouter.GET("/travels", router.controller.ListTravels)
	userRouter.GET("/travels/:id", router.controller.GetTravelById)
	userRouter.POST("/travels", router.controller.AddNewTravel)
	userRouter.PATCH("/travels/:id", router.controller.UpdateTravelById)
	userRouter.DELETE("/travels/:id", router.controller.DeleteTravel)
}

func (router *Router) stationRoutes(superRoute *gin.RouterGroup) {
	userRouter := superRoute.Group("/v1")
	userRouter.GET("/stations", router.controller.FindStations)
	// userRouter.GET("/station/:id", router.controller.GetTravelById)
	// userRouter.POST("/station", router.controller.AddNewTravel)
	// userRouter.PATCH("/station/:id", router.controller.UpdateTravelById)
	// userRouter.DELETE("/station/:id", router.controller.DeleteTravel)
}

func (router *Router) seatRoutes(superRoute *gin.RouterGroup) {
	seatRouter := superRoute.Group("/v1")
	seatRouter.GET("/seats", router.controller.FindAvailableSeats)
}
