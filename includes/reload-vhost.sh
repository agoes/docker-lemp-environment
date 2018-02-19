#!/bin/bash

WORKSPACE="../code/"
DOCKER_COMPOSE=$(which docker-compose)

source ../sites.sh

if [ "${#SITES[@]}" -ne 0 ]; then
    echo "Cleanup available and enabled server blocks"
    $DOCKER_COMPOSE exec web sh -c "rm /etc/nginx/sites-enabled/*" && \
        rm ../images/web/sites-available/*

    for hostname in "${!SITES[@]}"
    do
        ./add-site.sh $hostname ${SITES[$hostname]}
    done

    echo "Restarting web container"
    $DOCKER_COMPOSE restart web && $DOCKER_COMPOSE ps
else
    echo "Cannot add/update vhost. SITES is empty or not set. Add sites in sites.sh, see the example in etc/sites.sh.example"
fi