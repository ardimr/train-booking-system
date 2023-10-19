package controller

import (
	"net/http"

	"github.com/ardimr/train-booking-system/internal/booking/model"
	"github.com/ardimr/train-booking-system/internal/booking/usecase"
	"github.com/ardimr/train-booking-system/internal/exception"
	"github.com/gin-gonic/gin"
)

type BookingController struct {
	bookingUseCase usecase.IBookingUseCase
}

func NewBookingController(bookingUseCase usecase.IBookingUseCase) *BookingController {
	return &BookingController{
		bookingUseCase: bookingUseCase,
	}
}

func (controller *BookingController) NewBooking(ctx *gin.Context) {

	var reqBody model.BookingRequestBody

	if err := ctx.ShouldBindJSON(&reqBody); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	// Store new booking
	bookingDetails, err := controller.bookingUseCase.NewBooking(ctx, reqBody)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	// The following process is proceed with assumptions the payment is success
	// err = controller.querier.CreateBooking(ctx, bookingDetails)
	// if err != nil {
	// 	ctx.AbortWithStatusJSON(
	// 		http.StatusInternalServerError,
	// 		gin.H{"Err": err.Error()},
	// 	)
	// 	return
	// }

	ctx.JSON(
		http.StatusAccepted,
		gin.H{"Booking code": bookingDetails.BookingCode},
	)
}

func (controller *BookingController) GetBookingDetails(ctx *gin.Context) {
	var reqUri model.BookingRequestUri
	var reqParam model.BookingRequestParam

	if err := ctx.ShouldBindUri(&reqUri); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	if err := ctx.ShouldBindQuery(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	bookingDetails, err := controller.bookingUseCase.GetBookingDetails(ctx, reqParam.TravelId, reqUri.BookingCode)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.JSON(http.StatusOK, bookingDetails)

}

func (controller *BookingController) PayBooking(ctx *gin.Context) {
	var reqUri model.PayBookingRequestParam

	if err := ctx.ShouldBindQuery(&reqUri); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	err := controller.bookingUseCase.PayBooking(ctx, reqUri.TravelID, reqUri.BookingCode)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.Status(http.StatusAccepted)
}
