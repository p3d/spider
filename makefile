help:
	@echo "How to use:"
	@echo
	@echo "  $$ make build    build the local docker infrastructure"
	@echo "  $$ make run-dev  run the container with rails in the development environment"

build:
	docker build -t spider:latest .
run-dev:
	docker run --rm -it -p 3000:3000 -e RAILS_ENV='development' spider
run-console:
	docker run --rm -it  spider	rails c