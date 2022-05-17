SHELL := /bin/bash

IMAGE_NAME ?= git-insecure-workshop
IMAGE_TAG ?= v1
CITY ?= Lisbon

build:
	docker build --no-cache -t $(IMAGE_NAME):$(IMAGE_TAG) .

run:
	docker run --rm -it --env API_KEY="${API_KEY}" git-insecure-workshop:v1 $(CITY)

container_scanning:
	echo "hi"
