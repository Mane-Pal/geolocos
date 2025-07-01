#!/bin/bash
# Install printing support

set -e

sudo pacman -S --noconfirm cups cups-pdf cups-filters system-config-printer

# Enable printing service
if [ "$USER" != "testuser" ]; then
    sudo systemctl enable --now cups.service
else
    echo "Test environment detected, skipping cups service start"
fi
