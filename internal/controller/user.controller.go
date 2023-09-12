package controller

import (
	"database/sql"
	"net/http"

	"github.com/ardimr/train-booking-system/internal/model"
	"github.com/gin-gonic/gin"
)

func (controller *Controller) ListUsers(ctx *gin.Context) {}
func (controller *Controller) GetUserDetails(ctx *gin.Context) {
	var reqUri model.UserRequestUri

	if err := ctx.BindUri(&reqUri); err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusBadRequest,
			gin.H{"Error": err.Error()},
		)
	}

	userDetails, err := controller.querier.GetUserDetails(ctx, reqUri.UserId)

	if err != nil {
		switch err {
		case sql.ErrNoRows:
			ctx.AbortWithStatus(http.StatusNotFound)
			return
		default:
			ctx.AbortWithStatusJSON(
				http.StatusInternalServerError,
				gin.H{"Error": err.Error()},
			)
		}
	}

	ctx.JSON(http.StatusOK, userDetails)
}
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
