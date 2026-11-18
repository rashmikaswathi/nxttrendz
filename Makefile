
.PHONY: build up down logs migrate superuser shell push

IMAGE_NAME = nxttrendz-backend
DOCKER_ID = rashmikaswathi
VERSION = v1

build:
	docker compose build

up:
	docker compose up -d --build

down:
	docker compose down

logs:
	docker compose logs -f backend

migrate:
	docker compose exec backend python manage.py migrate

superuser:
	docker compose exec backend python manage.py createsuperuser

shell:
	docker compose exec backend bash

push:
	docker tag $(IMAGE_NAME) $(DOCKER_ID)/$(IMAGE_NAME):$(VERSION)
	docker tag $(IMAGE_NAME) $(DOCKER_ID)/$(IMAGE_NAME):latest
	docker push $(DOCKER_ID)/$(IMAGE_NAME):$(VERSION)
	docker push $(DOCKER_ID)/$(IMAGE_NAME):latest
