version: '3.6'

services:
  traefik:
    image: traefik
    restart: always
    ports:
      - 80:80
      - 443:443
    networks:
      - devnet
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /opt/traefik/traefik.toml:/traefik.toml
      - /opt/traefik/acme.json:/acme.json
    container_name: traefik

networks:
  devnet:
    external:
      name: traefik_default