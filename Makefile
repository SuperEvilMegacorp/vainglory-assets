# SHELL := /bin/bash -e
.PHONY: run, test, fixture
.DEFAULT_GOAL := test

server:
	docker-compose up

deploy:
	docker-compose run --rm app middleman build --clean && ./deploy.sh

lint:
	@docker-compose run --rm app rubocop

# docker-compose-up: deps
# 	docker-compose up -d

deps: .built

.built:
	docker-compose build
	touch .built

clean: stop
	docker-compose stop
	rm -f .built

stop:
	docker-compose stop

#NOTE: This globally stops and deletes *all* running containers in all projects.  Useful :) @BJC
clean-all:
	docker stop $$(docker ps -a -q)
	docker rm $$(docker ps -a -q)
