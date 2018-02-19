#!/bin/bash

DOCKER_COMPOSE=$(which docker-compose)

$DOCKER_COMPOSE down
$DOCKER_COMPOSE up --build -d
./reload-vhost.sh