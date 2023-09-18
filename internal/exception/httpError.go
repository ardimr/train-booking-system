package exception

import (
	"database/sql"
	"errors"
	"fmt"
	"net/http"
)

type HttpError struct {
	Description string `json:"description,omitempty"`
	StatusCode  int    `json:"statusCode"`
}

func NewHttpError(statusCode int, description string) HttpError {
	return HttpError{
		Description: description,
		StatusCode:  statusCode,
	}
}

func ParseError(err error) HttpError {
	switch {
	case errors.Is(err, sql.ErrNoRows):
		return NewHttpError(http.StatusNotFound, "Not Found")
	default:
		return NewHttpError(http.StatusInternalServerError, "Internal Server Error")
	}
}

func (e HttpError) Error() string {
	return fmt.Sprintf("description: %s", e.Description)
}

func (e HttpError) Status() int {
	return e.StatusCode
}
