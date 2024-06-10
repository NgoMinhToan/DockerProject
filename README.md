## RUN with Network
```
- Postgres sql
docker compose -f postgres/docker-compose.yml -f config-network/docker-compose.yml up -d

- Nginx reverse proxy
docker compose -f nginx/docker-compose.yml -f config-network/docker-compose.yml up -d

- Traefik reverse proxy
docker-compose -f traefik/docker-compose.yaml -f config-network/docker-compose.yml up -d

- n8n
docker-compose -f n8n/docker-compose.yml -f config-network/docker-compose.yml up -d n8n

- Cloudflare
docker run cloudflare/cloudflared:latest tunnel --no-autoupdate run --token eyJhIjoiYzBkZTYzYTQ3ZWJlZDVmODU1MmIwMDViZmQ4ZDNiYTUiLCJ0IjoiNmFiZjJmM2YtZTA4My00NWI4LWI1MTMtOTdiMTU1ZDcwMGYxIiwicyI6Ik5UazVZelppTnpBdE16VTBZUzAwWkRVd0xUazRZMkV0WmprMk5XSTFaV1ppTXpRdyJ9

docker compose -f cloudflare/docker-compose.yml -f config-network/docker-compose.yml up -d

- vps|tailscale
docker-compose -f tailscale/docker-compose.yaml -f config-network/docker-compose.yml up -d tailscale

- pihole|tailscale
docker-compose -f tailscale-pihole/docker-compose.yaml up -d 

- tailscale-pihole-exit-node
docker-compose -f tailscale-pihole-exit-node/docker-compose.yaml up -d

```









## Run with scale
```
 --scale service_name=2
```

### Public

- [github](https://github.com/NgoMinhToan/DockerProject)

