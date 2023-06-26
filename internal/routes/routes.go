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
	router.userRoutes(superRoute)
	// router.sfmRoutes(superRoute)
}

func (router *Router) userRoutes(superRoute *gin.RouterGroup) {
	userRouter := superRoute.Group("/v1")
	userRouter.GET("/travels", router.controller.ListTravels)
	userRouter.GET("/travels/:id", router.controller.GetTravelById)
	userRouter.POST("/travels", router.controller.AddNewTravel)
	userRouter.PATCH("/travels/:id", router.controller.UpdateTravelById)
	userRouter.DELETE("/travels/:id", router.controller.DeleteTravel)
}
