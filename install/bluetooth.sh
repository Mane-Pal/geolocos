#!/bin/bash
# Install bluetooth controls

set -e

yay -S --noconfirm --needed blueberry

# Turn on bluetooth by default
if [ "$USER" != "testuser" ]; then
    sudo systemctl enable --now bluetooth.service
else
    echo "Test environment detected, skipping bluetooth service start"
fi
