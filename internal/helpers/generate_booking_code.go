package helpers

import (
	"math/rand"
	"time"
)

const charSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

func GenerateBookingCode() string {
	var seededRand *rand.Rand = rand.New(rand.NewSource(time.Now().UnixNano()))
	length := 7
	ran_str := make([]byte, length)

	// Generating Random string
	for i := 0; i < length; i++ {
		ran_str[i] = charSet[seededRand.Intn(len(charSet))]
	}

	return string(ran_str)
}
