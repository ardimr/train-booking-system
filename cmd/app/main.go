package main

import (
	"fmt"
	"go_project_template/configs/db"
	"go_project_template/configs/redis"
	"go_project_template/internal/controller"
	"go_project_template/internal/query"
	router "go_project_template/internal/routes"
	"os"
	"strconv"

	"github.com/gin-contrib/gzip"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
)

func main() {
	fmt.Println("Running App1")

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
		fmt.Println(err.Error())
		return
	} else {
		fmt.Println("Connected to DB")
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
		fmt.Println("Failed to connect redis")
	}

	// Setup REST Server
	restServer := gin.New()
	restServer.Use(gin.Recovery())
	restServer.Use(gin.Logger())
	restServer.Use(gzip.Gzip(gzip.DefaultCompression))

	// Setup Router
	userController := controller.NewController(query.NewPostgresQuerier(dbConnection))
	userRouter := router.NewRouter(userController)

	userRouter.AddRoute(restServer.Group("/api"))
	restServer.Run("localhost:8080")

}
