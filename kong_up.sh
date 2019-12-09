#!/bin/sh
echo "Kong Gateway Docker Compose Up"
docker-compose up -d
echo "Let's create some services and routes in the gatway!"
read -p "But we have to wait for the gateway to start..." -t 15
./api_startup.sh