#!/usr/bin/env

DELETE_FLAG="true"

ENV=dev
API_TARGET="http://web:5000"
API_REPORT_FILE="api_report.json"
CONTAINER_NAME="zap2docker_scan"
APP_DIR="rest-api-goat"

if [ $DELETE_FLAG == "true" ]
then
	docker-compose rm -f web
	docker-compose rm -f zap2docker
fi

pushd "$APP_DIR"
docker-compose up -d web
docker-compose logs web
docker-compose up -d py-web
docker-compose logs py-web
docker-compose run --name "$CONTAINER_NAME" -d -e ENV=dev -e REPORT_FILE="$API_REPORT_FILE" -e TARGET="$API_TARGET" zap2docker
docker logs -f "$CONTAINER_NAME"
popd "$APP_DIR"
