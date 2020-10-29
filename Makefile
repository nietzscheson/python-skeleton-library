.PHONY:

init: down up logs

pull:
	docker-compose pull
build: pull
	docker-compose build
up: build
	docker-compose up -d
down:
	docker-compose down -v --remove-orphans
logs:
	docker-compose logs
tox:
	docker-compose run --rm py tox
