package helpers

import (
	"encoding/json"
	"net/http"

	authModel "github.com/ardimr/train-booking-system/internal/auth/model"
	"github.com/gin-gonic/gin"
)

func GetUserInfo(ctx *gin.Context) authModel.UserInfo {
	var userInfo authModel.UserInfo
	user, ok := ctx.Get("user-info")

	if !ok {
		ctx.AbortWithStatus(http.StatusForbidden)
	}
	userByte, _ := json.Marshal(user)
	err := json.Unmarshal(userByte, &userInfo)

	if err != nil {
		ctx.AbortWithStatusJSON(http.StatusInternalServerError, err.Error())
	}

	return userInfo
}
