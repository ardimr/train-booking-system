package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/exception"
	"github.com/ardimr/train-booking-system/internal/user/model"
	"github.com/ardimr/train-booking-system/internal/user/usecase"
	"github.com/gin-gonic/gin"
)

type UserController struct {
	userUseCase usecase.IUserUseCase
}

func NewUserController(userUseCase usecase.IUserUseCase) *UserController {
	return &UserController{
		userUseCase: userUseCase,
	}
}

func (controller *UserController) GetUserDetails(ctx *gin.Context) {
	var reqUri model.UserRequestUri
	if err := ctx.BindUri(&reqUri); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	userDetails, err := controller.userUseCase.GetUserDetails(ctx, reqUri.UserId)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.JSON(http.StatusOK, userDetails)
}

func (controller *UserController) NewUser(ctx *gin.Context) {
	var reqBody model.NewUserRequestBody

	if err := ctx.BindJSON(&reqBody); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.JSON(
		http.StatusAccepted,
		reqBody,
	)
}
