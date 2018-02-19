#!/bin/bash

$(which docker-compose) up -d
echo && $(which docker-compose) ps
