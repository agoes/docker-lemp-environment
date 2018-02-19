#!/bin/bash

DOCKER_COMPOSE=$(which docker-compose)

read -p "This will REMOVE all your existing containers, data and rebuild all images. Your application code will NOT REMOVED. Continue (y/n)? " choice
case "$choice" in 
  y|Y ) 
    $DOCKER_COMPOSE down
    $DOCKER_COMPOSE up --build -d
    ./reload-vhost.sh
    ;;
  *) echo "Canceled";;
esac
