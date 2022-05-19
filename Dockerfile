# The latest image
FROM python:slim-buster

LABEL org.opencontainers.image.authors="arainho.it@gmail.com"
LABEL org.opencontainers.image.description="git-insecure-workshop"

# Create a dedicated user 😊
ENV APP_USER="appuser"
ENV APP_GROUP="appgroup"
ENV APP_LOCATION="/home/$APP_USER/app"
RUN mkdir -p $APP_LOCATION/$CONFIG_FOLDER && \
    addgroup --gid 9999 $APP_GROUP && \
    adduser --uid 9999 -D -G $APP_GROUP -h $APP_LOCATION $APP_USER

# Running as user appuser 😂
USER $APP_USER
WORKDIR /app

# Add only what we need 😉
COPY ./requirements.txt requirements.txt
RUN python -m pip install --upgrade pip && \
    python -m pip install -r requirements.txt

ENTRYPOINT [ "python3", "get_wheather.py"]
