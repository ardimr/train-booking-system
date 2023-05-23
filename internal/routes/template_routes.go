package router

import (
	"go_project_template/internal/controller"

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
	userRouter := superRoute.Group("/user-service")
	userRouter.GET("/users", router.controller.GetUsers)
	userRouter.GET("/users/:id", router.controller.GetUserById)
	userRouter.POST("/users", router.controller.AddNewUser)
	userRouter.PATCH("/users", router.controller.UpdateUser)
	userRouter.DELETE("/users/:id", router.controller.DeleteUser)
}
