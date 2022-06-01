#!bin/bash

docker compose up --build
mkdir -p /home/jpeyron/data/db-data
mkdir -p /home/jpeyron/data/web-data
docker compose down -v