package auth

import (
	"github.com/gin-gonic/gin"
)

type AuthRouter struct {
	auth *AuthService
}

func NewSeatRouter(auth *AuthService) *AuthRouter {
	return &AuthRouter{
		auth: auth,
	}
}

func (au *AuthRouter) RegisterRoute(superRoute *gin.RouterGroup) {
	authRouter := superRoute.Group("/auth")
	authRouter.POST("/signin", au.auth.SignIn)
	authRouter.POST("/signup", au.auth.SignUp)

	authRouter.GET("/verify-otp", au.auth.VerifyOTP)
	authRouter.POST("/request-otp", au.auth.RequestOTP)
}
