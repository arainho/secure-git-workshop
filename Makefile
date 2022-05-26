SHELL := /bin/bash

REGISTRY ?= localbuild
IMAGE_NAME ?= git-insecure-workshop
IMAGE_TAG ?= v1
CITY ?= Aveiro

TRUFFLEHOG_ENTROPY ?= False
TRUFFLEHOG_REPORT ?= trufflehog_report.json
SHHGIT_CONFIG_FILE ?= "config.yaml"
DOCKERFILE_NAME ?= Dockerfile

build:
	docker build -t $(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG) -f $(DOCKERFILE_NAME) .

rebuild:
	docker build --no-cache -t $(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG) -f $(DOCKERFILE_NAME) .

container_scanning: audit_grype

audit_grype:
	docker pull anchore/grype
	docker run \
		   --rm \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   anchore/grype \
		   --only-fixed \
		   --fail-on critical \
		   $(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)

audit_trivy:
	docker pull aquasec/trivy
	docker run \
		   --rm \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   -v $(HOME)/.cache:/root/.cache/ aquasec/trivy \
		   image --severity=HIGH,CRITICAL \
		   $(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)
