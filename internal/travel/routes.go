package travel

import (
	"github.com/ardimr/train-booking-system/internal/travel/controller"
	"github.com/gin-gonic/gin"
)

type TravelRouter struct {
	travelController *controller.TravelController
}

func NewTravelRouter(travelController *controller.TravelController) *TravelRouter {
	return &TravelRouter{
		travelController: travelController,
	}
}

func (router *TravelRouter) RegisterRoute(superRoute *gin.RouterGroup) {
	travelRouter := superRoute.Group("/v1")
	travelRouter.GET("/travels", router.travelController.ListTravels)
	travelRouter.GET("/travels/:id", router.travelController.GetTravelById)
	travelRouter.POST("/travels", router.travelController.AddNewTravel)
}
