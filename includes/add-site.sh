#!/bin/bash

ERROR=0
SERVER_NAME=$1
DOCUMENT_ROOT="/var/www/$2"
WORKSPACE="../code/$SERVER_NAME"
DOCKER_COMPOSE=$(which docker-compose)
SERVER_BLOCK_TEMPLATE="../etc/server_block.conf"
SERVER_BLOCK="../images/web/sites-available/site-$SERVER_NAME.conf"
NGINX_SITES_AVAILABLE="/etc/nginx/sites-available/site-$SERVER_NAME.conf"
NGINX_SITES_ENABLED="/etc/nginx/sites-enabled/$SERVER_NAME.conf"

if [ "$1" != "" ] && [ "$2" != "" ]; then
    cp $SERVER_BLOCK_TEMPLATE $SERVER_BLOCK
    sed -i "s/<server_name>/$SERVER_NAME/g" $SERVER_BLOCK
    if [ $? -eq 1 ]; then
        ERROR=1
    fi
    sed -i "s/<document_root>/${DOCUMENT_ROOT//\//\\/}/g" $SERVER_BLOCK
    if [ $? -eq 1 ]; then
        ERROR=1
    fi

    if [ $ERROR -eq 0 ]; then
        echo "Enabling $SERVER_NAME"
        $DOCKER_COMPOSE exec web sh -c "ln -s $NGINX_SITES_AVAILABLE $NGINX_SITES_ENABLED"
    fi
fi

