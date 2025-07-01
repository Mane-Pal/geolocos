#!/bin/bash
# Install Hyprland window manager

set -e

yay -S --noconfirm --needed \
  hyprland hyprshot hyprpicker hyprlock hypridle hyprpolkitagent hyprland-qtutils \
  wofi waybar mako swaybg \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  kanshi \
  wlr-randr \
  nwg-displays

# Create Hyprland auto-start configuration
# This will be preserved after chezmoi applies dotfiles
mkdir -p "$HOME/.config/shell"

# Create a persistent dev-environment file that survives chezmoi updates  
if ! grep -q "exec Hyprland" "$HOME/.config/shell/dev-environment" 2>/dev/null; then
    cat >> "$HOME/.config/shell/dev-environment" << 'EOF'

# Auto-start Hyprland on tty1 (preserved after chezmoi)
[[ -z $DISPLAY && $(tty) == /dev/tty1 ]] && exec Hyprland
EOF
fi

echo "✅ Hyprland auto-start configured - will be preserved after chezmoi setup"