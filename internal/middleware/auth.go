package middleware

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"

	"github.com/ardimr/train-booking-system/internal/auth"
	"github.com/ardimr/train-booking-system/internal/auth/model"
	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt"
)

func ValidateToken(auth *auth.AuthService) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// Check the authorization header
		authHeader := ctx.GetHeader("Authorization")

		if len(authHeader) == 0 {
			ctx.AbortWithStatus(http.StatusUnauthorized)
			return
		}
		// Get token string in bearer
		tokenString := authHeader[len("Bearer "):]

		// Validate token
		token, err := auth.ValidateToken(tokenString)

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"Error": err.Error()})
			return
		}

		// Get token claims
		claims, ok := token.Claims.(jwt.MapClaims)
		if ok && token.Valid {
			// Put user data in the context as value
			ctx.Set("user-info", claims)
			ctx.Next()
		} else {
			ctx.JSON(http.StatusUnauthorized, gin.H{"Error": err.Error()})
			return
		}
	}
}

func UserHasPermission(auth *auth.AuthService) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// Get the user information from the request header
		var userInfo model.UserInfo
		user, ok := ctx.Get("user-info")
		if !ok {
			ctx.AbortWithStatus(http.StatusForbidden)
		}
		userByte, _ := json.Marshal(user)
		err := json.Unmarshal(userByte, &userInfo)

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, err.Error())
		}
		// Get user Permissions from the request header
		var rolePermission model.RolePermission
		rawRolePermission, ok := ctx.Get("user-permissions")

		if !ok {
			ctx.AbortWithStatus(http.StatusForbidden)
		}

		rolePermissionByte, _ := json.Marshal(rawRolePermission)
		err = json.Unmarshal(rolePermissionByte, &rolePermission)

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, err.Error())
		}

		// fmt.Println(rolePermission)

		// Get action method
		action := ActionFromMethod(ctx.Request.Method)

		// Get the requested resource from the url
		// The requested resource is the third element of the splitted path
		// api/user-management/resource -> [api, user-management, resource]
		resource := strings.Split(ctx.Request.URL.Path, "/")[3]

		if err != nil {
			ctx.AbortWithStatusJSON(
				http.StatusBadRequest,
				gin.H{
					"Error": err.Error(),
				},
			)
			return
		}

		if !ok || !auth.CheckPermission(rolePermission, resource, action) {
			ctx.AbortWithStatusJSON(
				http.StatusForbidden,
				gin.H{
					"Message": fmt.Sprintf("Forbidden Access, Not Allowed to %s %s", action, resource),
				},
			)
			return
		}
		ctx.Next()
	}
}

func MiddlewareSetUserPermissions(auth *auth.AuthService) gin.HandlerFunc {

	return func(ctx *gin.Context) {
		// Get user's info from the validated token
		var userInfo model.UserInfo
		user, ok := ctx.Get("user-info")

		if !ok {
			ctx.AbortWithStatus(http.StatusUnauthorized)
		}

		userByte, _ := json.Marshal(user)
		err := json.Unmarshal(userByte, &userInfo)

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"Error": err.Error()})
		}

		// Get user's permission from the database
		rolePermissions, err := auth.Repository.GetRolePermissionsByUsername(ctx, userInfo.Username)

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusForbidden, gin.H{"Error": err.Error()})
		}

		// Attach user's permission on the header
		ctx.Set("user-permissions", rolePermissions)
		ctx.Next()
	}
}

func ActionFromMethod(httpMethod string) string {
	switch httpMethod {
	case "GET":
		return "view"
	case "POST":
		return "add"
	case "DELETE":
		return "delete"
	case "PATCH":
		return "edit"
	default:
		return ""
	}
}
