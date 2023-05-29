SHELL := /bin/bash
SONAR_URL = "https://sonarcloud.io"
SONAR_TOKEN ?= SONAR_TOKEN
CURRENT_DIR ?= $(shell pwd)

sonar:
    docker run \
        --rm \
        -e SONAR_HOST_URL ?= "http://${SONAR_URL} \
        -e SONAR_LOGIN ?= $SONAR_TOKEN \
        -v "${YOUR_REPO}:/usr/src" \
        sonarsource/sonar-scanner-cli

bandit:
    docker run \
        --rm \
        -v $(CURRENT_DIR):/data \
        cytopia/bandit \
        -r /data
