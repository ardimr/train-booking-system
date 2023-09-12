package repository

import (
	"context"

	"github.com/ardimr/train-booking-system/configs/db"
	"github.com/ardimr/train-booking-system/internal/model"
	"github.com/redis/go-redis/v9"
)

type Repository interface {
	ListTravels(ctx context.Context, param model.TravelScheduleReqParam) ([]model.TravelSchedule, error)
	GetTravelById(ctx context.Context, id int64, class string) (*model.Travel, error)
	AddNewTravel(ctx context.Context, newTravel model.AddNewTravel) (int64, error)
	UpdateTravelById(ctx context.Context, id int64, newTravel model.Travel) (int64, error)
	DeleteTravel(ctx context.Context, id int64) error

	// Stations
	FindStations(ctx context.Context, param model.StationRequestParam) ([]model.CityStation, error)
	AddStation(ctx context.Context, newStation model.NewStation) error
	EditStation(ctx context.Context, stationCode string, newStation model.NewStation) error
	DeleteStation(ctx context.Context, stationCode string) error

	// Seats
	FindAvailableSeats(ctx context.Context, param model.AvailableSeatRequestParam) ([]model.AvailableSeat, error)
	AddSeats(ctx context.Context, wagonId int64, numberOfRows int) error
	// Tickets
	GetUserTickets(ctx context.Context, param model.GetUserTicketsRequestParam) ([]model.UserTicket, error)
	GetTicketDetailsById(ctx context.Context, param model.GetTicketDetailsRequestUri) (model.TicketDetails, error)

	// Bookings
	CreateBooking(ctx context.Context, booking model.BookingDetails) error

	// Users
	GetUserDetails(ctx context.Context, userId int64) (model.UserDetails, error)
}

type PostgresRepository struct {
	db db.DBInterface
}

func NewPostgresRepository(db db.DBInterface) *PostgresRepository {
	return &PostgresRepository{
		db: db,
	}
}

type IRedisRepository interface {
	CreateBooking(ctx context.Context, booking model.BookingRequestBody) (model.BookingDetails, error)
	GetBookedSeats(ctx context.Context, travelId int64) ([]int64, error)
	GetBooking(ctx context.Context, travelId int64, bookingCode string) (model.BookingDetails, error)
}
type RedisRepository struct {
	redisClient *redis.Client
}

func NewRedisRepository(redisClient *redis.Client) *RedisRepository {
	return &RedisRepository{
		redisClient: redisClient,
	}
}

// Query Implementation
