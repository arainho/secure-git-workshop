# VULNERABLE IMAGE ... ⚡⚡⚡ ☠️☠️☠️
FROM python:3.5-slim-buster

LABEL org.opencontainers.image.authors="arainho.it@gmail.com"
LABEL org.opencontainers.image.description="git-insecure-workshop"

# HARDCODED SECRET ... ⚡⚡⚡ ☠️☠️☠️
ENV API_KEY="secure-password"

WORKDIR /app

# Adding all files ... 🙃🙃🙃 🕷🕷🕷
COPY . .

# Add only what we need 😂😂😂
# COPY ./requirements.txt requirements.txt

RUN python -m pip install --upgrade pip && \
    python -m pip install -r requirements.txt

ENTRYPOINT [ "python3", "get_wheather.py"]
