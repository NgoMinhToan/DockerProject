## RUN with Network
```
- Postgres sql
docker compose -f postgres/docker-compose.yml -f config-network/docker-compose.yml up -d

- Nginx reverse proxy
docker compose -f nginx/docker-compose.yml -f config-network/docker-compose.yml up -d

- Cloudflare
docker compose -f cloudflare/docker-compose.yml -f config-network/docker-compose.yml up -d

- Traefik reverse proxy
docker-compose -f traefik/docker-compose.yaml -f config-network/docker-compose.yml up -d reverse-proxy

- n8n
docker-compose -f n8n/docker-compose.yml -f config-network/docker-compose.yml up -d n8n

```