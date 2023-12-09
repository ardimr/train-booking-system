package train

import (
	"github.com/ardimr/train-booking-system/internal/auth"
	"github.com/ardimr/train-booking-system/internal/middleware"
	"github.com/ardimr/train-booking-system/internal/train/controller"
	"github.com/gin-gonic/gin"
)

type TrainRouter struct {
	trainController *controller.TrainController
	auth            *auth.AuthService
}

func NewTrainRouter(trainController *controller.TrainController, auth *auth.AuthService) *TrainRouter {
	return &TrainRouter{
		trainController: trainController,
		auth:            auth,
	}
}

func (router *TrainRouter) RegisterRouter(superRoute *gin.RouterGroup) {
	trainRouter := superRoute.Group("/v1")
	trainRouter.GET("/trains", router.trainController.ListTrains)
	trainRouter.GET("/trains/:train_code", router.trainController.GetTrain)
	trainRouter.POST("/trains",
		middleware.ValidateToken(router.auth),
		middleware.SetUserPermission(router.auth),
		middleware.UserHasPermission(router.auth), router.trainController.AddNewTrain)

	trainRouter.PUT("/trains/train_code",
		middleware.ValidateToken(router.auth),
		middleware.SetUserPermission(router.auth),
		middleware.UserHasPermission(router.auth), router.trainController.EditTrain)

	trainRouter.DELETE("/trains/:train_code",
		middleware.ValidateToken(router.auth),
		middleware.SetUserPermission(router.auth),
		middleware.UserHasPermission(router.auth), router.trainController.DeleteTrain)
}
