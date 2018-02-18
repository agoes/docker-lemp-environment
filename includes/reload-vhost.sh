#!/bin/bash

WORKSPACE="../code/"
DOCKER_COMPOSE=$(which docker-compose)

echo "Cleanup available and enabled server blocks"
$DOCKER_COMPOSE exec web sh -c "rm /etc/nginx/sites-enabled/*" && \
    rm ../images/web/sites-available/*

source ../sites.sh
for hostname in "${!SITES[@]}"
do
    ./add-site.sh $hostname ${SITES[$hostname]}
done

echo "Restarting web container"
$DOCKER_COMPOSE restart web && \
    $DOCKER_COMPOSE ps