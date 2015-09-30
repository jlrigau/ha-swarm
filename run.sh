#!/bin/sh
set -e

DOCKER_COMPOSE_VERSION="1.4.2"

sudo su
curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

sed -i 's/<node_ip>/10.0.10.xx/g' primary.yml

docker-compose -f primary.yml up -d