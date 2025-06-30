#!/bin/bash
# GeolOS - Arch Linux Setup Script

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$SCRIPT_DIR/install"

# Core installation (required)
source "$INSTALL_DIR/01-yay.sh"
source "$INSTALL_DIR/02-identification.sh"
source "$INSTALL_DIR/03-terminal.sh"
source "$INSTALL_DIR/04-core-tools.sh"

# System configuration
source "$INSTALL_DIR/system-config.sh"

# Always install components
source "$INSTALL_DIR/hyprland.sh"
source "$INSTALL_DIR/desktop.sh"
source "$INSTALL_DIR/development.sh"
source "$INSTALL_DIR/fonts.sh"
source "$INSTALL_DIR/docker.sh"
source "$INSTALL_DIR/bluetooth.sh"
source "$INSTALL_DIR/power.sh"
source "$INSTALL_DIR/printer.sh"
source "$INSTALL_DIR/xtras.sh"
source "$INSTALL_DIR/backgrounds.sh"
source "$INSTALL_DIR/mimetypes.sh"

# Setup dotfiles (final step)
source "$INSTALL_DIR/05-chezmoi.sh"

# Update locate database
sudo updatedb

echo "Installation completed! Consider rebooting to apply all changes."