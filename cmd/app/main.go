package main

import (
	"log"
	"os"
	"strconv"

	"github.com/ardimr/train-booking-system/configs/db"
	"github.com/ardimr/train-booking-system/configs/redis"
	"github.com/ardimr/train-booking-system/internal/controller"
	"github.com/ardimr/train-booking-system/internal/repository"
	router "github.com/ardimr/train-booking-system/internal/routes"

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

	// Setup REST Server
	restServer := gin.New()
	restServer.Use(gin.Recovery())
	restServer.Use(gin.Logger())
	restServer.Use(gzip.Gzip(gzip.DefaultCompression))

	// Setup CORS Policy
	corsConfig := cors.Default()
	restServer.Use(corsConfig)

	// Seat Router
	seatRepo := seatRepository.NewSeatRepository(dbConnection)
	seatRedisRepo := seatRepository.NewSeatRedisRepository(redisClient)
	seatUseCase := seatUseCase.NewSeatUseCase(seatRepo, seatRedisRepo)
	seatController := seatController.NewSeatController(seatUseCase)
	seatRouter := seat.NewSeatRouter(seatController)
	seatRouter.RegisterRoute(restServer.Group("/api"))

	// Station Router
	stationRepo := stationRepository.NewStationRepository(dbConnection)
	stationUseCase := stationUseCase.NewStationUsecase(stationRepo)
	stationController := stationController.NewStationController(stationUseCase)
	stationRouter := station.NewStationRouter(stationController)
	stationRouter.RegisterRoute(restServer.Group("/api"))
	// Setup Router
	tbsController := controller.NewController(repository.NewPostgresRepository(dbConnection), repository.NewRedisRepository(redisClient))
	tbsRouter := router.NewRouter(tbsController)

	tbsRouter.AddRoute(restServer.Group("/api"))
	restServer.Run("localhost:8080")

}
