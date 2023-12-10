package auth

import (
	"database/sql"
	"errors"
	"fmt"
	"log"
	"net/http"
	"strings"
	"time"

	"github.com/ardimr/train-booking-system/internal/auth/model"
	"github.com/ardimr/train-booking-system/internal/auth/repository"
	"github.com/ardimr/train-booking-system/internal/auth/usecase"
	"github.com/ardimr/train-booking-system/internal/exception"
	"github.com/ardimr/train-booking-system/internal/utils"
	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"

	"github.com/golang-jwt/jwt"
)

type MyClaims struct {
	jwt.StandardClaims
	UserID   int64  `json:"UserID"`
	Username string `json:"Username"`
	Email    string `json:"Email"`
}

type Authentication interface {
	// Authenticate(reqUser *model.User, user *model.User)
	GenerateNewToken(user model.UserInfo) (string, error)
	ValidateToken(tokenString string) (*jwt.Token, error)
	CheckPermission(userRolePermission model.RolePermission, resource string, action string) bool
}

type AuthService struct {
	Issuer     string
	ExpiresAt  int64
	SigningKey []byte
	useCase    usecase.IAuthUseCase
	Repository repository.IAuthRepository
	Cache      repository.IAuthRedisRepository
}

type TokenPair struct {
	AccessToken  string
	RefreshToken string
}

func NewAuthService(issuer string, expiresAt int64, signingKey []byte, useCase usecase.IAuthUseCase, querier repository.IAuthRepository, cache repository.IAuthRedisRepository) *AuthService {
	return &AuthService{
		Issuer:     issuer,
		ExpiresAt:  expiresAt,
		SigningKey: signingKey,
		useCase:    useCase,
		Repository: querier,
		Cache:      cache,
	}
}

func (auth *AuthService) SignIn(ctx *gin.Context) {
	// Get username and password as the basic auth
	username, password, ok := ctx.Request.BasicAuth()
	if !ok {
		ctx.AbortWithStatus(http.StatusBadRequest)
		log.Println("Not a basic auth")
		return
	}

	// Get user's info from database
	user, err := auth.Repository.GetUserInfoByUsername(ctx, username)
	if err != nil {
		switch err {
		case sql.ErrNoRows:
			ctx.JSON(http.StatusUnauthorized, gin.H{"Error": "User not found"})
		default:
			ctx.JSON(http.StatusInternalServerError, gin.H{"Error": err.Error()})
		}
		return
	}

	// Check if the userPassword is correct
	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password)); err != nil {
		ctx.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"Error": "Incorrect Password"})
		return
	}

	// User is authenticated, proceed to generate new token
	newTokenPair, err := auth.GenerateNewTokenPair(user)

	if err != nil {
		ctx.AbortWithError(http.StatusInternalServerError, errors.New("failed to generate new token"))
	}

	// c.SetCookie("token", newToken, 60, "/", "localhost", false, true)
	ctx.JSON(http.StatusOK, gin.H{
		"access_token":  newTokenPair.AccessToken,
		"refresh_token": newTokenPair.RefreshToken,
	})
}

func (auth *AuthService) SignUp(ctx *gin.Context) {
	// Get user info from sign up form
	var newUser model.NewUser
	if err := ctx.ShouldBindJSON(&newUser); err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusBadRequest,
			gin.H{"Error": err.Error()},
		)
		return
	}

	// Generate hashed password
	hashedPassword, err := HashPassword(newUser.Password)

	if err != nil {
		ctx.AbortWithStatusJSON(
			http.StatusInternalServerError,
			gin.H{"Error": err.Error()},
		)

		return
	}

	newUser.Password = hashedPassword

	// Generate OTP
	otp, secret, err := utils.GenerateOTP(
		"train.booking.system",
		newUser.Email,
		300,
	)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
	}

	// User OTP Verification data
	userOTPVerification := model.UserOTPVerification{
		OTPCode: otp,
		Secret:  secret,
		Email:   newUser.Email,
	}

	// Store temporary in database for 5 minutes
	expiration := time.Duration(5) * time.Minute

	err = auth.Cache.SetUserOTP(ctx, otp, userOTPVerification, expiration)
	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
	}

	// Add new user to the datasbase
	newId, err := auth.Repository.AddNewUser(ctx, newUser)

	if err != nil {

		ctx.AbortWithStatusJSON(
			http.StatusInternalServerError,
			gin.H{"Error": err.Error()},
		)
		return
	}

	ctx.JSON(
		http.StatusOK,
		gin.H{"New Id": newId},
	)
}

func (auth *AuthService) RequestOTP(ctx *gin.Context) {
	var reqBody model.UserOTPRequest
	if err := ctx.ShouldBindJSON(&reqBody); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	err := auth.useCase.RequestNewOTP(ctx, reqBody.Email)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.Status(http.StatusAccepted)
}

func (auth *AuthService) VerifyOTP(ctx *gin.Context) {
	// var reqBody model.UserOTPVerification
	var reqParam model.UserOTPVerificationParam
	if err := ctx.ShouldBindQuery(&reqParam); err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	email, err := auth.useCase.VerifyOTP(ctx, reqParam.OTPCode)

	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	// OTP is verified, Mark the user's email address as verified in the database

	err = auth.useCase.UpdateEmailVerificationStatus(ctx, email)
	if err != nil {
		ctx.AbortWithStatusJSON(exception.ErrorResponse(err))
		return
	}

	ctx.Status(http.StatusOK)
}

func (auth *AuthService) GenerateNewToken(user *model.UserInfo) (string, error) {
	// log.Println("Exp: ", auth.ExpiresAt)
	claims := MyClaims{
		StandardClaims: jwt.StandardClaims{
			Issuer:    auth.Issuer,
			ExpiresAt: time.Now().Add(time.Duration(auth.ExpiresAt) * time.Second).Unix(),
		},
		Username: user.Username,
		Email:    user.Email,
	}

	token := jwt.NewWithClaims(
		jwt.SigningMethodHS256,
		claims,
	)

	signedToken, err := token.SignedString(auth.SigningKey)

	if err != nil {
		return "", err
	}

	return signedToken, nil
}

func (auth *AuthService) GenerateNewTokenPair(user *model.UserInfo) (TokenPair, error) {
	var tokenPair TokenPair
	// log.Println("Exp: ", auth.ExpiresAt)
	claims := MyClaims{
		StandardClaims: jwt.StandardClaims{
			Issuer:    auth.Issuer,
			ExpiresAt: time.Now().Add(time.Duration(auth.ExpiresAt) * time.Second).Unix(),
		},
		UserID:   user.ID,
		Username: user.Username,
		Email:    user.Email,
	}

	accessToken := jwt.NewWithClaims(
		jwt.SigningMethodHS256,
		claims,
	)

	signedAccessToken, err := accessToken.SignedString(auth.SigningKey)

	if err != nil {
		return tokenPair, err
	}

	refreshClaims := MyClaims{
		StandardClaims: jwt.StandardClaims{
			Issuer:    auth.Issuer,
			ExpiresAt: time.Now().Add(time.Duration(auth.ExpiresAt) * time.Second).Unix(),
		},
		Username: user.Username,
	}

	refreshToken := jwt.NewWithClaims(
		jwt.SigningMethodHS256,
		refreshClaims,
	)
	signedRefreshToken, err := refreshToken.SignedString(auth.SigningKey)

	if err != nil {
		return tokenPair, err
	}

	tokenPair.AccessToken = signedAccessToken
	tokenPair.RefreshToken = signedRefreshToken

	return tokenPair, nil
}

func (auth *AuthService) ValidateToken(tokenString string) (*jwt.Token, error) {
	mySigningKey := auth.SigningKey

	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		// Don't forget to validate the alg is what you expect:
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}
		// hmacSampleSecret is a []byte containing your secret, e.g. []byte("my_secret_key")
		return mySigningKey, nil
	})

	if err != nil {
		return nil, err
	}

	return token, nil
}

func (auth *AuthService) CheckPermission(userRolePermission model.RolePermission, resource string, action string) bool {

	for _, rolePermission := range userRolePermission.Permissions {
		if rolePermission.ResourceName == resource {
			for _, actionPermitted := range rolePermission.Actions {
				if strings.ToLower(actionPermitted) == action {
					return true
				}
			}
		}
	}

	return false
}

func HashPassword(password string) (string, error) {
	// Convert password string to slice of byte
	passwordBytes := []byte(password)

	// Hash password with bycript's min cost
	hashedPasswordBytes, err := bcrypt.GenerateFromPassword(passwordBytes, bcrypt.MinCost)

	return string(hashedPasswordBytes), err
}

func (auth *AuthService) RefreshToken(ctx *gin.Context) {
	// Validate the refresh token

	// Generate new token pair

	ctx.Status(http.StatusOK)
}
