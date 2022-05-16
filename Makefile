SHELL := /bin/bash

IMAGE_NAME ?= git-insecure-workshop
IMAGE_TAG ?= v1.0.0
DEFAULT_TAG ?= latest
BUILD_PATH ?= $(PWD)

TRUFFLEHOG_ENTROPY ?= False
TRUFFLEHOG_REPORT ?= trufflehog_report.json
SHHGIT_CONFIG_FILE ?= "config.yaml"

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

secret_detection: audit_trufflehog audit_shhgit

audit_trufflehog:
  docker run \
       -t \
       --rm \
       -v $(PWD):/target dxa4481/trufflehog \
       --max_depth=20 \
       --json \
       --regex \
       --entropy=$(TRUFFLEHOG_ENTROPY) \
       file:///target | tee $(RESULTS_FOLDER)/trufflehog_report.json | jq -C
 
 audi_shhgit_prepare:
	rm -f -- "$(PWD)/$(RESULTS_FOLDER)"
	rm -f -- "$(SHHGIT_CONFIG_FILE)"
	curl https://raw.githubusercontent.com/eth0izzle/shhgit/master/config.yaml -o "$(SHHGIT_CONFIG_FILE)"

audit_shhgit: audi_shhgit_prepare
	docker run \
		   --rm \
		   -v "$(PWD):/src/" \
		   -v /tmp/config.yaml:/app/config.yaml \
		   eth0izzle/shhgit \
		   -debug \
		   -local "/src" \
		   -config-path /app/ \
		   -entropy-threshold 0 \
		   -csv-path "/src/$(RESULTS_FOLDER)"
