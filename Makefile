SHELL := /bin/bash

REGISTRY ?= docker.io
IMAGE_NAME ?= git-insecure-workshop
IMAGE_TAG ?= v1.0.0
DEFAULT_TAG ?= latest
BUILD_PATH ?= $(PWD)
RESULTS_FOLDER ?= reports

TRUFFLEHOG_ENTROPY ?= False
TRUFFLEHOG_REPORT ?= trufflehog_report.json
SHHGIT_CONFIG_FILE ?= "config.yaml"


login:
	@echo $(TOKEN) | docker login -u "$(THE_USER)" --password-stdin

build:
	cd $(BUILD_PATH) && \
	docker build --no-cache --tag $(IMAGE_NAME):$(IMAGE_TAG) .

tag:
	docker image tag $(IMAGE_NAME):$(IMAGE_TAG) $(REGISTRY)/$(THE_USER)/$(IMAGE_NAME):$(IMAGE_TAG)

list:
	docker images | grep $(IMAGE_NAME) | grep $(IMAGE_TAG)

scan:
	docker scan $(IMAGE_NAME):$(IMAGE_TAG) \
		    --accept-license \
		    --severity high \
		    -f Dockerfile

push: login build tag list
	docker image push $(REGISTRY)/$(THE_USER)/$(IMAGE_NAME):$(IMAGE_TAG)

secret_detection: audit_trufflehog audit_shhgit

init:
	mkdir -p "$(PWD)/$(RESULTS_FOLDER)"

audit_trufflehog: init
	docker run \
		-t \
		--rm \
		-v $(PWD):/target dxa4481/trufflehog \
		--max_depth=20 \
		--json \
		--regex \
		--branch=step8 \
		--entropy=$(TRUFFLEHOG_ENTROPY) \
		file:///target | jq -C
 
shhgit_prepare: init
	rm -f -- "$(SHHGIT_CONFIG_FILE)"
	curl https://raw.githubusercontent.com/eth0izzle/shhgit/master/config.yaml -o "/tmp/$(SHHGIT_CONFIG_FILE)"

audit_shhgit: shhgit_prepare
	docker run \
		   --rm \
		   -v "$(PWD):/src/" \
		   -v "/tmp/$(SHHGIT_CONFIG_FILE):/app/$(SHHGIT_CONFIG_FILE)" \
		   eth0izzle/shhgit \
		   -debug \
		   -local "/src" \
		   -config-path /app/ \
		   -entropy-threshold 0 \
