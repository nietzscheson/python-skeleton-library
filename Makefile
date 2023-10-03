.PHONY:

init: down up logs

#pull:
#	docker-compose pull
#build: pull
#	docker-compose build
#up: build
#	docker-compose up -d
#down:
#	docker-compose down -v --remove-orphans
#logs:
#	docker-compose logs
tox:
	tox
prune:
	make down
	docker volume prune -f
	docker system prune -f
check:
	python setup.py check -m -s && black . && black . --check
	flake8 .
test:
	coverage run -m unittest discover
	coverage report -m
poetry.update:
	docker-compose run --rm core poetry update
