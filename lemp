#!/bin/bash
ERROR=0

echo ""

if [ ! -d code ]; then
    echo "code directory not found."
    mkdir code

    if [ $? -eq 0 ]; then
        printf "code directory was created. Think it's kinda like htdocs directory for your environment\n"
    else
        ERROR=1
    fi
fi

if [ ! -f sites.sh ]; then
    echo "sites.sh not found."
    cp ./etc/sites.sh.example ./sites.sh

    if [ $? -eq 0 ]; then
        printf "sites.sh was created. Map your vhost and document root there\n"
    else
        ERROR=1
    fi
fi

if [ "$ERROR" -ne 1 ] && [ "$1" != "" ]; then
    if [ "$1" == "init" ]; then
        $(which docker-commpose) up -d
    else
        cd includes/ && ./$1.sh
    fi
fi