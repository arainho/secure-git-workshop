FROM python:3.9

ENV APP_DIR /webapp/src
ENV PYTHONUNBUFFERED=1

COPY simple_server.py ${APP_DIR}/
WORKDIR ${APP_DIR}
CMD ["python", "simple_server.py"]
