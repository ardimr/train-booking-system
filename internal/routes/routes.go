package router

import (
	"github.com/ardimr/train-booking-system/internal/controller"

	"github.com/gin-gonic/gin"
)

type Router struct {
	controller *controller.Controller
}

func NewRouter(controller *controller.Controller) *Router {
	return &Router{
		controller: controller,
	}
}

func (router *Router) AddRoute(superRoute *gin.RouterGroup) {
	router.travelRoutes(superRoute)
	router.stationRoutes(superRoute)
	router.seatRoutes(superRoute)
	router.ticketRoutes(superRoute)
	router.bookingRoutes(superRoute)
	router.userRoutes(superRoute)
}

func (router *Router) travelRoutes(superRoute *gin.RouterGroup) {
	travelRouter := superRoute.Group("/v1")
	travelRouter.GET("/travels", router.controller.ListTravels)
	travelRouter.GET("/travels/:id", router.controller.GetTravelById)
	travelRouter.POST("/travels", router.controller.AddNewTravel)
	travelRouter.PATCH("/travels/:id", router.controller.UpdateTravelById)
	travelRouter.DELETE("/travels/:id", router.controller.DeleteTravel)
}

func (router *Router) stationRoutes(superRoute *gin.RouterGroup) {
	stationRouter := superRoute.Group("/v1")
	stationRouter.GET("/stations", router.controller.FindStations)
	stationRouter.POST("/stations", router.controller.AddStation)
	stationRouter.PATCH("/stations/:station_code", router.controller.EditStation)
	stationRouter.DELETE("/stations/:station_code", router.controller.DeleteStation)
}

func (router *Router) seatRoutes(superRoute *gin.RouterGroup) {
	seatRouter := superRoute.Group("/v1")
	seatRouter.GET("/seats", router.controller.FindAvailableSeats)
}

func (router *Router) userRoutes(superRoute *gin.RouterGroup) {
	userRouter := superRoute.Group("/v1")
	userRouter.POST("users", router.controller.NewUser)
}

func (router *Router) bookingRoutes(superRoute *gin.RouterGroup) {
	bookingRouter := superRoute.Group(("/v1"))
	bookingRouter.POST("/bookings", router.controller.NewBooking)
}

func (router *Router) ticketRoutes(superRoute *gin.RouterGroup) {
	ticketRouter := superRoute.Group("/v1")
	ticketRouter.GET("/tickets", router.controller.GetUserTickets)
	ticketRouter.GET("/tickets/:ticket_id", router.controller.GetTicketDetailsById)
}
