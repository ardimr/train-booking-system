package booking

import (
	"github.com/ardimr/train-booking-system/internal/auth"
	"github.com/ardimr/train-booking-system/internal/booking/controller"
	"github.com/ardimr/train-booking-system/internal/middleware"
	"github.com/gin-gonic/gin"
)

type BookingRouter struct {
	bookingController *controller.BookingController
	auth              *auth.AuthService
}

func NewBookingRouter(bookingController *controller.BookingController, auth *auth.AuthService) *BookingRouter {
	return &BookingRouter{
		bookingController: bookingController,
		auth:              auth,
	}
}

func (router *BookingRouter) RegisterRoute(superRoute *gin.RouterGroup) {
	bookingRouter := superRoute.Group("/v1")
	bookingRouter.POST("/bookings", middleware.ValidateToken(router.auth), router.bookingController.NewBooking)
	bookingRouter.GET("/bookings/:booking_code", router.bookingController.GetBookingDetails)
	bookingRouter.GET("/bookings/:booking_code/payment", router.bookingController.GetBookingDetails)
	bookingRouter.GET("/bookings/payment/webhook", router.bookingController.PayBooking)
}
