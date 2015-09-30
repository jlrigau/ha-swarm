#!/bin/sh
set -e

DOCKER_COMPOSE_VERSION="1.4.2"

sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sed -i 's/{{" $1 "}}/" $2 "/g' primary.yml

docker-compose -