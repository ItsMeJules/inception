#!bin/bash

mkdir -p $HOME/data/db-data
mkdir -p $HOME/data/web-data
docker compose up --build
docker compose down -v
sudo rm -rf $HOME/data