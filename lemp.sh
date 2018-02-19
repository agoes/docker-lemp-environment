#!/bin/bash

if [ ! -d code ]; then
    mkdir code
fi

if [ ! -f sites.sh ]; then
    touch sites.sh
fi

if [ $1 == "init" ]; then
    $(which docker-commpose) up -d
else
    cd includes/ && ./$1.sh
fi