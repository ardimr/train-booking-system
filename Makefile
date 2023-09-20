run_app:
	go run cmd/app/main.go

docker_build:
	docker build -t tbs:v0.1 -f build/Dockerfile .