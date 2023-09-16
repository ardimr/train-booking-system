package user

import (
	"github.com/ardimr/train-booking-system/internal/wagon/controller"
	"github.com/gin-gonic/gin"
)

type WagonRouter struct {
	userController *controller.WagonController
}

func NewWagonRouter(userController *controller.WagonController) *WagonRouter {
	return &WagonRouter{
		userController: userController,
	}
}

func (router *WagonRouter) RegisterRoute(superRoute *gin.RouterGroup) {
	userRouter := superRoute.Group("/v1")
	userRouter.POST("/wagons")
	userRouter.GET("/wagons/:wagon_id")
}
