# ha-swarm

High availability in Docker Swarm

Start Consul

```
docker-compose -f primary.yml up -d consul
```

Replace node IP

```
sed -i 's/<node_ip>/10.0.10.xx/g' primary.yml
```

Then run Swarm Agent

```
docker-compose -f primary.yml up -d swarm
```