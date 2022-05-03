FROM python:3.9
LABEL maintainer="arainho.it@gmail.com"

ENV PORT_NUMBER="9999"
ENV APP_USER="appuser"
ENV APP_GROUP="appgroup"
ENV APP_LOCATION="/usr/local/app"
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

HEALTHCHECK --interval=3m --timeout=3s \
  CMD curl -f http://localhost:${PORT_NUMBER}/ || exit 1
RUN mkdir -p $APP_LOCATION && \
    addgroup --gid 9999 $APP_GROUP && \
    adduser --uid 9999 -D -G $APP_GROUP -h $APP_LOCATION $APP_USER

# RUN application as a non-sudo user 😊😉
USER $APP_USER
COPY simple_server.py ${APP_LOCATION}/
COPY openapi.json ${APP_LOCATION}/
COPY openapi.yaml ${APP_LOCATION}/
WORKDIR ${APP_LOCATION}

EXPOSE $PORT_NUMBER
CMD ["python", "simple_server.py"]
