#!/usr/bin/env bash

# Install docker
which docker || curl -sSL https://get.docker.com/ | sh

# Install docker compose
curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install htpassed util
apt-get install apache2-utils -y

# Generate certs
mkdir -p /certs
openssl req -x509 -nodes -newkey rsa:4096 -keyout /certs/registry_key.pem -out /certs/registry_cert.pem -days 365 \
-subj "/C=CA/ST=Ontario/L=Toronto/O=Aiva Labs/OU=Aiva/CN=registry.example.com"

# Add default user
chmod +x add_user.sh
./add_user.sh atsushi !letmein23

# Run compose file
docker-compose up -d