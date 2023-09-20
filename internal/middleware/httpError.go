package middleware

import (
	"fmt"
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
				fmt.Printf("type of a is %T\n", e)
				ctx.AbortWithStatusJSON(e.StatusCode, e.Description)
			default:
				fmt.Printf("type of a is %T\n", e)
				fmt.Println(e.Error())
				ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"Error": "Service is unavailable"})
			}
		}
	}
}
