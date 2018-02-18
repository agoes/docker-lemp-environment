#!/bin/bash

if [ ! -d code ]; then
    mkdir code
fi

if [ $1 == "init" ]; then
    $(which docker-commpose) up -d
else
    cd includes/ && ./$1.sh
fi