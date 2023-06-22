package controller

import (
	"database/sql"
	"go_project_template/internal/model"
	"go_project_template/internal/repository"
	"net/http"

	"github.com/gin-gonic/gin"
)

type Controller struct {
	querier repository.Repository
}

func NewController(q repository.Repository) *Controller {
	return &Controller{
		querier: q,
	}
}

// Controller Implementation

func (controller *Controller) GetUsers(ctx *gin.Context) {
	// Get users data from db
	users, err := controller.querier.GetUsers(ctx)
	if err != nil {
		ctx.JSON(
			http.StatusInternalServerError,
			gin.H{
				"Message": err.Error(),
			},
		)
		return
	}

	ctx.JSON(
		http.StatusOK,
		users,
	)
}

func (controller *Controller) GetUserById(ctx *gin.Context) {
	var reqUri model.GetUserByIdReqUri

	// Request URI Binding
	if err := ctx.BindUri(&reqUri); err != nil {
		ctx.JSON(
			http.StatusBadRequest,
			gin.H{
				"message": err.Error(),
			},
		)
		return
	}

	user, err := controller.querier.GetUserById(ctx, reqUri.ID)

	if err != nil {
		switch err {
		case sql.ErrNoRows:
			ctx.JSON(
				http.StatusNotFound,
				gin.H{
					"Message": "Not Found",
				},
			)
		}
		return
	}

	// Success state
	ctx.JSON(
		http.StatusOK,
		user,
	)
}

func (controler *Controller) AddNewUser(ctx *gin.Context) {
	var newUser model.User

	if err := ctx.BindJSON(&newUser); err != nil {
		ctx.JSON(
			http.StatusBadRequest,
			gin.H{
				"Message": err.Error(),
			},
		)
		return
	}

	newId, err := controler.querier.AddNewUser(ctx, newUser)

	if err != nil {
		ctx.JSON(
			http.StatusInternalServerError,
			gin.H{
				"Message": err.Error(),
			},
		)

		return
	}

	ctx.JSON(
		http.StatusOK,
		gin.H{
			"New Id": newId,
		},
	)
}

func (controller *Controller) UpdateUser(ctx *gin.Context) {
	var user model.User

	if err := ctx.BindJSON(&user); err != nil {
		ctx.JSON(
			http.StatusBadRequest,
			gin.H{
				"Message": err.Error(),
			},
		)
		return
	}

	res, err := controller.querier.UpdateUser(ctx, user)

	if err != nil {
		ctx.JSON(
			http.StatusInternalServerError,
			gin.H{
				"Message": err.Error(),
			},
		)
		return
	}

	ctx.JSON(
		http.StatusOK,
		gin.H{
			"Rows affected": res,
		},
	)
}

func (controller *Controller) DeleteUser(ctx *gin.Context) {
	var reqUri model.DeleteUserReqUri

	if err := ctx.BindUri(&reqUri); err != nil {
		ctx.JSON(
			http.StatusBadRequest,
			gin.H{
				"Message": err.Error(),
			},
		)
		return
	}

	if err := controller.querier.DeleteUser(ctx, reqUri.ID); err != nil {
		ctx.JSON(
			http.StatusInternalServerError,
			gin.H{
				"Message": err.Error(),
			},
		)
	}

	ctx.Status(
		http.StatusOK,
	)
}
