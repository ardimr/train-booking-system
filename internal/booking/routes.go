package booking

import (
	"github.com/ardimr/train-booking-system/internal/booking/controller"
	"github.com/gin-gonic/gin"
)

type BookingRouter struct {
	bookingController *controller.BookingController
}

func NewBookingRouter(bookingController *controller.BookingController) *BookingRouter {
	return &BookingRouter{
		bookingController: bookingController,
	}
}

func (router *BookingRouter) RegisterRoute(superRoute *gin.RouterGroup) {
	bookingRouter := superRoute.Group("/v1")
	bookingRouter.GET("/bookings/:booking_code", router.bookingController.GetBookingDetails)
	bookingRouter.POST("/bookings", router.bookingController.NewBooking)
}
