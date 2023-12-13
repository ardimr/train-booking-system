package usecase

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"os"
	"time"

	queueclient "github.com/ardimr/train-booking-system/configs/queue_client"
	"github.com/ardimr/train-booking-system/internal/auth/model"
	"github.com/ardimr/train-booking-system/internal/auth/repository"
	"github.com/ardimr/train-booking-system/internal/utils"
)

type IAuthUseCase interface {
	RegisterUser(ctx context.Context, newUser model.NewUser) (int64, error)
	RequestNewOTP(ctx context.Context, email string) error
	VerifyOTP(ctx context.Context, otpCode string) error
	UpdateEmailVerificationStatus(ctx context.Context, email string) error
}

type AuthUseCase struct {
	authRepo  repository.IAuthRepository
	authCache repository.IAuthRedisRepository
	publisher *queueclient.Publisher
}

func NewAuthUseCase(authRepo repository.IAuthRepository, authCache repository.IAuthRedisRepository, publisher *queueclient.Publisher) *AuthUseCase {
	return &AuthUseCase{
		authRepo:  authRepo,
		authCache: authCache,
		publisher: publisher,
	}
}

func (uc *AuthUseCase) RegisterUser(ctx context.Context, newUser model.NewUser) (int64, error) {
	// Generate hashed password
	hashedPassword, err := utils.HashPassword(newUser.Password)
	if err != nil {
		return 0, err
	}
	newUser.Password = hashedPassword

	// Add new user to the datasbase
	newUser.IsVerified = false
	newId, err := uc.authRepo.AddNewUser(ctx, newUser)
	if err != nil {
		return 0, err
	}

	// Generate OTP
	otp, secret, err := utils.GenerateOTP(
		"train.booking.system",
		newUser.Email,
		300,
	)

	if err != nil {
		return 0, err
	}

	// User OTP Verification data
	userOTPVerification := model.UserOTPVerification{
		OTPCode: otp,
		Secret:  secret,
		Email:   newUser.Email,
	}

	// Store temporary in database for 5 minutes
	expiration := time.Duration(5) * time.Minute
	err = uc.authCache.SetUserOTP(ctx, otp, userOTPVerification, expiration)
	if err != nil {
		return 0, err
	}

	// Email payload
	verificationEmailPayload := model.OTPVerificationEmailContent{
		Email:   userOTPVerification.Email,
		OTPCode: userOTPVerification.OTPCode,
		Url:     fmt.Sprintf("http://localhost:8080/api/auth/verify-otp?otp_code=%s", userOTPVerification.OTPCode),
	}

	// Publish Payload
	publishPayload, err := json.Marshal(verificationEmailPayload)
	if err != nil {
		return 0, err
	}

	queueName := os.Getenv("RABBITMQ_QUEUE_NAME")
	if err := uc.publisher.Publish(ctx, queueName, publishPayload); err != nil {
		return 0, err
	}

	return newId, nil
}

func (uc *AuthUseCase) RequestNewOTP(ctx context.Context, email string) error {
	// Check if email is already exist in database
	user, err := uc.authRepo.GetUserByEmail(ctx, email)

	if err != nil {
		return err
	}

	if user.IsVerified {
		return errors.New("[otp] user is already verified")
	}

	// Generate OTP
	otp, secret, err := utils.GenerateOTP(
		"train.booking.system",
		user.Email,
		300,
	)

	if err != nil {
		return err
	}

	// User OTP Verification data
	userOTPVerification := model.UserOTPVerification{
		OTPCode: otp,
		Secret:  secret,
		Email:   email,
	}

	// Store temporary in database for 5 minutes
	expiration := time.Duration(5) * time.Minute

	err = uc.authCache.SetUserOTP(ctx, otp, userOTPVerification, expiration)

	if err != nil {
		return err
	}

	verificationEmailPayload := model.OTPVerificationEmailContent{
		Email:   userOTPVerification.Email,
		OTPCode: userOTPVerification.OTPCode,
		Url:     fmt.Sprintf("http://localhost:8080/api/user-service/verify-otp?otp_code=%s", userOTPVerification.OTPCode),
	}

	// Publish Payload
	_, err = json.Marshal(verificationEmailPayload)

	if err != nil {
		return err
	}

	// err = uc.publisher.Publish(ctx, "mailQueue", publishPayload)

	// if err != nil {
	// 	return err
	// }

	return nil
}

func (uc *AuthUseCase) VerifyOTP(ctx context.Context, otpCode string) error {
	// Get the user otp secret from cache
	userOTP, err := uc.authCache.GetUserOTP(ctx, otpCode)
	if err != nil {
		return errors.New("otp.notfound")
	}

	if !utils.VerifyOTP(userOTP.Secret, otpCode) {
		return errors.New("otp.invalid")
	}

	err = uc.UpdateEmailVerificationStatus(ctx, userOTP.Email)
	if err != nil {
		return err
	}

	// Remove otp from cache
	err = uc.authCache.RemoveUserOTP(ctx, otpCode)

	if err != nil {
		return err
	}

	return nil
}

// UpdateEmailVerificationStatus implements IAuthUseCase.
func (uc *AuthUseCase) UpdateEmailVerificationStatus(ctx context.Context, email string) error {
	// Get Users by email
	user, err := uc.authRepo.GetUserByEmail(ctx, email)

	if err != nil {
		return err
	}
	// Update email status
	if user.IsVerified {
		return errors.New("user is already verified")
	}

	user.IsVerified = true
	_, err = uc.authRepo.UpdateUser(ctx, user)

	if err != nil {
		return err
	}

	return nil

}
