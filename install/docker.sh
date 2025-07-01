#!/bin/bash
# Install Docker and Docker Compose

set -e

yay -S --noconfirm --needed docker docker-compose

sudo mkdir -p /etc/docker

# Limit log size to avoid running out of disk
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

# Start Docker automatically
if [ "$USER" != "testuser" ]; then
    sudo systemctl enable docker
else
    echo "Test environment detected, skipping docker service enable"
fi

# Give this user privileged Docker access
if [ -n "$USER" ]; then
    sudo usermod -aG docker $USER
else
    echo "Warning: USER not set, skipping Docker group addition"
fi
