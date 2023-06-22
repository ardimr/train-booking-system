package main

import (
	"context"
	"log"
	"os"
	"strconv"

	cloudstorage "github.com/ardimr/train-booking-system/configs/cloud_storage"
	"github.com/ardimr/train-booking-system/configs/db"
	"github.com/ardimr/train-booking-system/configs/redis"
	"github.com/ardimr/train-booking-system/internal/controller"
	"github.com/ardimr/train-booking-system/internal/repository"
	router "github.com/ardimr/train-booking-system/internal/routes"

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

	_, err = redis.NewRedisClient(
		redisHost,
		redisPassword,
		redisDB,
	)

	if err != nil {
		log.Fatalln("Failed to connect redis")
	}

	// Setup Cloud Storage
	var cloudClient cloudstorage.CloudStorageInterface

	cloudStorageUseSSL, err := strconv.ParseBool(os.Getenv("CLOUD_STORAGE_USE_SSL"))
	if err != nil {
		log.Fatalln(err)
	}

	minioClient, err := cloudstorage.NewMinioClient(
		os.Getenv("CLOUD_STORAGE_ENDPOINT"),
		os.Getenv("CLOUD_STORAGE_ACCESS_KEY"),
		os.Getenv("CLOUD_STORAGE_SECRET_KEY"),
		cloudStorageUseSSL,
	)
	if err != nil {
		log.Fatalln(err)
	}

	// Use minio as cloud client
	cloudClient = minioClient

	cloudClient.ListBuckets(context.Background())

	// Setup REST Server
	restServer := gin.New()
	restServer.Use(gin.Recovery())
	restServer.Use(gin.Logger())
	restServer.Use(gzip.Gzip(gzip.DefaultCompression))

	// Setup Router
	userController := controller.NewController(repository.NewPostgresRepository(dbConnection))
	userRouter := router.NewRouter(userController)

	userRouter.AddRoute(restServer.Group("/api"))
	// restServer.Run("localhost:8080")

}
