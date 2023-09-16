package user

import (
	"github.com/ardimr/train-booking-system/internal/user/controller"
	"github.com/gin-gonic/gin"
)

type UserRouter struct {
	userController *controller.UserController
}

func NewUserRouter(userController *controller.UserController) *UserRouter {
	return &UserRouter{
		userController: userController,
	}
}

func (router *UserRouter) RegisterRoute(superRoute *gin.RouterGroup) {
	userRouter := superRoute.Group("/v1")
	userRouter.POST("/users", router.userController.NewUser)
	userRouter.GET("/users/:user_id", router.userController.GetUserDetails)
}
