## RUN with Network
```
docker compose -f postgres/docker-compose.yml -f config-network/docker-compose.yml up -d

docker compose -f nginx/docker-compose.yml -f config-network/docker-compose.yml up -d

docker run cloudflare/cloudflared:latest tunnel --no-autoupdate run --token eyJhIjoiYzBkZTYzYTQ3ZWJlZDVmODU1MmIwMDViZmQ4ZDNiYTUiLCJ0IjoiNmFiZjJmM2YtZTA4My00NWI4LWI1MTMtOTdiMTU1ZDcwMGYxIiwicyI6Ik5UazVZelppTnpBdE16VTBZUzAwWkRVd0xUazRZMkV0WmprMk5XSTFaV1ppTXpRdyJ9

docker compose -f cloudflare/docker-compose.yml -f config-network/docker-compose.yml up -d

```