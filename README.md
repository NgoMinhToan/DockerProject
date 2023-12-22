## RUN with Network
```
docker compose -f postgres/docker-compose.yml -f config-network/docker-compose.yml up -d

docker compose -f nginx/docker-compose.yml -f config-network/docker-compose.yml up -d
```