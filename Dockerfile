# Image version pinning pros and cons ... 🤔
# FROM docker.io/python:latest
# FROM docker.io/python:3.9.13
FROM docker.io/python@sha256:9998bdce4f636c8922240100b2692482bfc7865a5ac6e89026f4d7af99695e65

LABEL org.opencontainers.image.authors="arainho.it@gmail.com"
LABEL org.opencontainers.image.description="git-insecure-workshop"

# Create a dedicated user 😊
ENV APP_USER="appuser"
ENV APP_GROUP="appgroup"
ENV APP_LOCATION="/home/$APP_USER/app"
RUN addgroup --gid 9999 $APP_GROUP && \
    adduser --uid 9999 --gid 9999 --disabled-password --gecos "AppUser" $APP_USER && \
    mkdir -p $APP_LOCATION

# Running as user appuser 😂
USER $APP_USER
WORKDIR /app

# Add only what we need 😉
COPY ./config.ini config.ini
COPY ./requirements.txt requirements.txt
COPY ./get_wheather.py get_wheather.py
RUN python -m pip install --upgrade pip && \
    python -m pip install -r requirements.txt

ENTRYPOINT [ "python3", "get_wheather.py" ]