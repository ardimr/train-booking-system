package main

import (
	"log"
	"os"
	"strconv"

	"github.com/ardimr/train-booking-system/configs/db"
	"github.com/ardimr/train-booking-system/configs/redis"

	// Auth
	"github.com/ardimr/train-booking-system/internal/auth"
	authRepository "github.com/ardimr/train-booking-system/internal/auth/repository"

	// Seats
	seat "github.com/ardimr/train-booking-system/internal/seat"
	seatController "github.com/ardimr/train-booking-system/internal/seat/controller"
	seatRepository "github.com/ardimr/train-booking-system/internal/seat/repository"
	seatUseCase "github.com/ardimr/train-booking-system/internal/seat/usecase"

	// Stations
	station "github.com/ardimr/train-booking-system/internal/station"
	stationController "github.com/ardimr/train-booking-system/internal/station/controller"
	stationRepository "github.com/ardimr/train-booking-system/internal/station/repository"
	stationUseCase "github.com/ardimr/train-booking-system/internal/station/usecase"

	// Tickets
	ticket "github.com/ardimr/train-booking-system/internal/ticket"
	ticketController "github.com/ardimr/train-booking-system/internal/ticket/controller"
	ticketRepository "github.com/ardimr/train-booking-system/internal/ticket/repository"
	ticketUseCase "github.com/ardimr/train-booking-system/internal/ticket/usecase"

	// Travels
	travel "github.com/ardimr/train-booking-system/internal/travel"
	travelController "github.com/ardimr/train-booking-system/internal/travel/controller"
	travelRepository "github.com/ardimr/train-booking-system/internal/travel/repository"
	travelUseCase "github.com/ardimr/train-booking-system/internal/travel/usecase"

	// Travels
	booking "github.com/ardimr/train-booking-system/internal/booking"
	bookingController "github.com/ardimr/train-booking-system/internal/booking/controller"
	bookingRepository "github.com/ardimr/train-booking-system/internal/booking/repository"
	bookingUseCase "github.com/ardimr/train-booking-system/internal/booking/usecase"

	// Users
	user "github.com/ardimr/train-booking-system/internal/user"
	userController "github.com/ardimr/train-booking-system/internal/user/controller"
	userRepository "github.com/ardimr/train-booking-system/internal/user/repository"
	userUseCase "github.com/ardimr/train-booking-system/internal/user/usecase"

	// Wagons
	wagon "github.com/ardimr/train-booking-system/internal/wagon"
	wagonController "github.com/ardimr/train-booking-system/internal/wagon/controller"
	wagonRepository "github.com/ardimr/train-booking-system/internal/wagon/repository"
	wagonUseCase "github.com/ardimr/train-booking-system/internal/wagon/usecase"

	"github.com/gin-contrib/cors"
	"github.com/gin-contrib/gzip"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
)

func main() {
	log.Println("Running App1")

	// Load .env
	godotenv.Load(".env")

	// Create new DB
	dbConnection, err := db.NewDB(
		os.Getenv("DB_HOST"),
		os.Getenv("DB_PORT"),
		os.Getenv("DB_USER"),
		os.Getenv("DB_PASSWORD"),
		os.Getenv("DB_NAME"),
	)

	if err != nil {
		log.Fatalln(err.Error())
		return
	} else {
		log.Println("Connected to DB")
	}
	defer dbConnection.Close()

	// Setup Redis client
	redisHost := os.Getenv("REDIS_HOST")
	redisPassword := os.Getenv("REDIS_PASSWORD")
	redisDB, _ := strconv.Atoi(os.Getenv("REDIS_DB"))

	redisClient, err := redis.NewRedisClient(
		redisHost,
		redisPassword,
		redisDB,
	)

	if err != nil {
		log.Fatalln("Failed to connect redis")
	}

	// Setup Cloud Storage
	// var cloudClient cloudstorage.CloudStorageInterface

	// cloudStorageUseSSL, err := strconv.ParseBool(os.Getenv("CLOUD_STORAGE_USE_SSL"))
	// if err != nil {
	// 	log.Fatalln(err)
	// }

	// minioClient, err := cloudstorage.NewMinioClient(
	// 	os.Getenv("CLOUD_STORAGE_ENDPOINT"),
	// 	os.Getenv("CLOUD_STORAGE_ACCESS_KEY"),
	// 	os.Getenv("CLOUD_STORAGE_SECRET_KEY"),
	// 	cloudStorageUseSSL,
	// )
	// if err != nil {
	// 	log.Fatalln(err)
	// }

	// Use minio as cloud client
	// cloudClient = minioClient

	// Setup CORS Policy
	corsConfig := cors.DefaultConfig()
	corsConfig.AllowOrigins = []string{"http://localhost:3000"}
	corsConfig.AllowCredentials = true
	corsConfig.AllowHeaders = append(corsConfig.AllowHeaders, "Authorization")

	// Setup REST Server
	restServer := gin.New()
	restServer.Use(gin.Recovery())
	restServer.Use(gin.Logger())
	restServer.Use(gzip.Gzip(gzip.DefaultCompression))
	restServer.Use(cors.New(corsConfig))

	// Middleware

	// Auth Service
	expiresAt, err := strconv.Atoi(os.Getenv("JWT_EXPIRES_AT"))
	if err != nil {
		log.Fatalln(err.Error())
	}
	authRepo := authRepository.NewPostgresQuerier(dbConnection)
	authService := auth.NewAuthService(
		os.Getenv("JWT_ISSUER"),
		int64(expiresAt),
		[]byte(os.Getenv("JWT_SIGNING_KEY")),
		authRepo,
	)
	authRouter := auth.NewSeatRouter(authService)
	authRouter.RegisterRoute(restServer.Group("/api"))

	// Seat Service
	seatRepo := seatRepository.NewSeatRepository(dbConnection)
	seatRedisRepo := seatRepository.NewSeatRedisRepository(redisClient)
	seatUseCase := seatUseCase.NewSeatUseCase(seatRepo, seatRedisRepo)
	seatController := seatController.NewSeatController(seatUseCase)
	seatRouter := seat.NewSeatRouter(seatController)
	seatRouter.RegisterRoute(restServer.Group("/api"))

	// Station Service
	stationRepo := stationRepository.NewStationRepository(dbConnection)
	stationUseCase := stationUseCase.NewStationUsecase(stationRepo)
	stationController := stationController.NewStationController(stationUseCase)
	stationRouter := station.NewStationRouter(stationController, authService)
	stationRouter.RegisterRoute(restServer.Group("/api"))

	// Ticket Service
	ticketRepo := ticketRepository.NewTicketRepository(dbConnection)
	ticketUseCase := ticketUseCase.NewTicketUseCase(ticketRepo)
	ticketController := ticketController.NewTicketController(ticketUseCase)
	ticketRouter := ticket.NewTicketRouter(ticketController, authService)
	ticketRouter.RegisterRoute(restServer.Group("/api"))

	// Travel Service
	travelRepo := travelRepository.NewTravelRepository(dbConnection)
	travelUseCase := travelUseCase.NewTravelUseCase(travelRepo)
	travelController := travelController.NewTravelController(travelUseCase)
	travelRouter := travel.NewTravelRouter(travelController)
	travelRouter.RegisterRoute(restServer.Group("/api"))

	// Booking Service
	bookingRepo := bookingRepository.NewBookingRepository(dbConnection)
	bookingRedisRepo := bookingRepository.NewRedisRepository(redisClient)
	bookingUseCase := bookingUseCase.NewBookingUseCase(bookingRepo, bookingRedisRepo)
	bookingController := bookingController.NewBookingController(bookingUseCase)
	bookingRouter := booking.NewBookingRouter(bookingController, authService)
	bookingRouter.RegisterRoute(restServer.Group("/api"))

	// User Service
	userRepo := userRepository.NewUserRepository(dbConnection)
	userUseCase := userUseCase.NewUserUseCae(userRepo)
	userController := userController.NewUserController(userUseCase)
	userRouter := user.NewUserRouter(userController)
	userRouter.RegisterRoute(restServer.Group("/api"))

	// Wagon Service
	wagonRepo := wagonRepository.NewWagonRepository(dbConnection)
	wagonUseCase := wagonUseCase.NewWagonUseCae(wagonRepo)
	wagonController := wagonController.NewWagonController(wagonUseCase)
	wagonRouter := wagon.NewWagonRouter(wagonController)
	wagonRouter.RegisterRoute(restServer.Group("/api"))

	// Setup Router
	// tbsController := controller.NewController(repository.NewPostgresRepository(dbConnection), repository.NewRedisRepository(redisClient))
	// tbsRouter := router.NewRouter(tbsController)

	// tbsRouter.AddRoute(restServer.Group("/api"))
	restServer.Run("0.0.0.0:8080")

}
