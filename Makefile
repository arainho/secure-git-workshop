SHELL := /bin/bash

verify:
	@git --version
	@docker --version
	@docker-compose --version
	@python3 -V
	@jq --version
	@curl --version
	@make --version

versions:
	@which git
	@which docker
	@which docker-compose
	@which python3
	@which jq
	@which curl
	@which make

up:
	docker-compose up -d
