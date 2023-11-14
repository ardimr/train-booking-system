MIGRATE_TAG := ardimr/tbs-db-migrate:dev
BACKEND_TAG := ardimr/tbs-backend:dev

run_app:
	go run cmd/app/main.go

docker_build:
	docker build -t tbs:v0.1 -f build/Dockerfile .

migration_up:
	migrate -database postgres://postgres:postgrespw@localhost:15432/train_booking_system_db?sslmode=disable -path=init/db/migrations/ up
	
new_migration:
	migrate create -ext sql -dir init/db/migrations -seq $(NAME)

build_migrate_image:
	docker image build --no-cache -t $(MIGRATE_TAG) -f ./init/db/Dockerfile ./init/db

push_migrate_image:
	docker push $(MIGRATE_TAG)

build_backend_image:
	docker image build --no-cache -t $(BACKEND_TAG) -f build/Dockerfile .

push_backend_image:
	docker push $(BACKEND_TAG)