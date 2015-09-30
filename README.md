# ha-swarm

High availability in Docker Swarm

## Replace node IP

```
sed -i 's/<consul_ip>/10.0.10.xx/g' docker-compose.yml
sed -i 's/<node_ip>/10.0.10.xx/g' docker-compose.yml
```

## Start Consul

```
docker-compose up -d consul
```

### Check Consul information

```
curl -v <consul_ip>:8500/v1/kv/swarm?recurse
```

## Run Swarm Agent

```
docker-compose up -d swarm
```

## Run Swarm Agent

```
docker-compose up -d swarm
```