#!/bin/sh

cp -f /vagrant/docker-compose.yml /home/vagrant/docker-compose.yml

NODE_IP=$(ip addr show eth1 | grep -o "192.168.33.10[0-9.]")

sed -i 's/<consul_ip>/192.168.33.100/g' /home/vagrant/docker-compose.yml
sed -i "s/<node_ip>/$NODE_IP/g" /home/vagrant/docker-compose.yml
