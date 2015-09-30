# ha-swarm

High availability in Docker Swarm

## Replace node IP

```
sed -i 's/<consul_ip>/10.0.10.xx/g' primary.yml
sed -i 's/<node_ip>/10.0.10.xx/g' primary.yml
```

## Start Consul

```
docker-compose -f primary.yml up -d consul
```

### Check Consul information

```
curl -v 10.0.10.24:8500/v1/kv/swarm?recurse
```

## Run Swarm Agent

```
docker-compose -f primary.yml up -d swarm
```

## Run Swarm Agent

```
docker-compose -f primary.yml up -d swarm
```