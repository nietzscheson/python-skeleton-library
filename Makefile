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
	docker-compose run --rm core tox
prune:
	make down
	docker volume prune -f
	docker system prune -f
check:
	@docker-compose run --rm core python setup.py check -m -s && black . && black . --check
	@docker-compose run --rm core flake8 .
test:
	docker-compose run --rm core coverage run -m unittest discover
	docker-compose run --rm core coverage report -m
poetry.update:
	docker-compose run --rm core poetry update
