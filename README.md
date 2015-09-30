# High availability in Docker Swarm

![HA Swarm](ha-swarm.png)

## Install Docker compose

```
export DOCKER_COMPOSE_VERSION=1.4.2

curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

## Replace Consul and node IPs

```
sed -i 's/<consul_ip>/[CONSUL_IP]/g' docker-compose.yml
sed -i 's/<node_ip>/[NODE_IP]/g' docker-compose.yml
```

## Configure Docker engine

Open and edit ```/etc/default/docker``` file

```
sudo vi /etc/default/docker
```

Configure Docker engine to listen on ```0.0.0.0```

```
DOCKER_OPTS="-H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375"
```

Then restart Docker engine

```
sudo service docker restart
```

## On Consul node

```
docker-compose up -d consul
```

## On each node

```
docker-compose up -d swarm-agent swarm-manager
```

## Check Consul information

```
curl [CONSUL_IP]:8500/v1/kv/nodes?recurse | jq '.'
```

## Check Cluster information

```
DOCKER_HOST=[NODE_IP]:4000 docker info
```
