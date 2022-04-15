SHELL := /bin/bash

IMAGE_NAME ?= wheather-docker
IMAGE_TAG ?= v1.0.0
DEFAULT_TAG ?= latest
BUILD_PATH ?= python-docker

build:
	cd $(BUILD_PATH) && \
	docker build --no-cache --tag $(IMAGE_NAME) .

tag:
	docker --tag $(IMAGE_NAME):$(DEFAULT_TAG) $(IMAGE_NAME):$(IMAGE_TAG)

list:
	docker images | grep $(IMAGE_NAME)

scan:
	docker scan $(IMAGE_NAME) \
		    --accept-license \
		    --severity high \
		    -f python-docker/Dockerfile 
