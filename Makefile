LAST_COMMIT := $(shell git rev-parse --short HEAD)

build:
	docker build -t tokozedg/devops.ge:${LAST_COMMIT} .
push: build
	docker push tokozedg/devops.ge:${LAST_COMMIT}
deploy:
	ssh komble 'bash -s ${LAST_COMMIT}' < deploy.sh

html:
	docker-compose run --rm hugo
dev:
	docker-compose up
