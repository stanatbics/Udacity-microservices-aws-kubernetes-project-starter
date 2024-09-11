FROM python:3.10-slim-buster

RUN apt update -y

RUN apt install build-essential libpq-dev -y

RUN pip install --upgrade pip setuptools wheel
WORKDIR /src
COPY ./analytics/requirements.txt requirements.txt
RUN pip install -r requirements.txt

ENV DB_USERNAME=myuser
ENV DB_PASSWORD=${POSTGRES_PASSWORD}
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5433
ENV DB_NAME=mydatabase
COPY ./analytics/app.py app.py
COPY ./analytics/config.py config.py
CMD python app.py
