package controller

import (
	"github.com/ardimr/train-booking-system/internal/repository"
)

type Controller struct {
	querier repository.Repository
	redis   repository.IRedisRepository
}

func NewController(q repository.Repository, r repository.IRedisRepository) *Controller {
	return &Controller{
		querier: q,
		redis:   r,
	}
}

// Controller Implementation
