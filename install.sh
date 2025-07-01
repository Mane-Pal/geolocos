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

# Network management (critical for WiFi)
source "$INSTALL_DIR/network.sh"

# Always install components (but not configure auto-start yet)
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

# Optional: Development languages (comment out if not needed)
source "$INSTALL_DIR/languages-python.sh"
source "$INSTALL_DIR/languages-go.sh"

# Setup dotfiles
source "$INSTALL_DIR/05-chezmoi.sh"

# Re-apply Hyprland auto-start after chezmoi (ensures it's not overwritten)
echo "Ensuring Hyprland auto-start is configured..."
mkdir -p "$HOME/.config/shell"
if ! grep -q "exec Hyprland" "$HOME/.config/shell/dev-environment" 2>/dev/null; then
    cat >> "$HOME/.config/shell/dev-environment" << 'EOF'

# Auto-start Hyprland on tty1 (applied after chezmoi)
[[ -z $DISPLAY && $(tty) == /dev/tty1 ]] && exec Hyprland
EOF
    echo "✅ Hyprland auto-start configured post-chezmoi"
else
    echo "✅ Hyprland auto-start already configured"
fi

# Update locate database
sudo updatedb

echo "Installation completed! Consider rebooting to apply all changes."