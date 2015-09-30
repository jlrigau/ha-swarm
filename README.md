# ha-swarm

High availability in Docker Swarm

Start Consul

```
docker-compose -f primary.yml up -d consul
```

Then run Swarm Agent

```
docker-compose -f primary.yml up -d swarm
```