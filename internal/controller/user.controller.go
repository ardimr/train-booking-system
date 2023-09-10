package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/model"
	"github.com/gin-gonic/gin"
)

func (controller *Controller) ListUsers(ctx *gin.Context) {}
func (controller *Controller) GetUser(ctx *gin.Context)   {}
func (controller *Controller) NewUser(ctx *gin.Context) {
	var reqBody model.NewUserRequestBody

	if err := ctx.BindJSON(&reqBody); err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusBadRequest,
			gin.H{"Err": err.Error()},
		)
		return
	}

	ctx.JSON(
		http.StatusAccepted,
		reqBody,
	)
}
func (controller *Controller) EditUser(ctx *gin.Context)   {}
func (controller *Controller) DeleteUser(ctx *gin.Context) {}
