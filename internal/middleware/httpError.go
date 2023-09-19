package middleware

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/exception"
	"github.com/gin-gonic/gin"
)

func HttpErrorHandler() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		ctx.Next()
		for _, err := range ctx.Errors {
			switch e := err.Err.(type) {
			case exception.HttpError:
				ctx.AbortWithStatusJSON(e.StatusCode, e.Description)
			default:
				ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"Error": "Service is unavailable"})
			}
		}
	}
}
