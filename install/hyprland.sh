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

# Start Hyprland on first session
# Create development environment file that chezmoi can source
mkdir -p "$HOME/.config/shell"

# Add Hyprland auto-start to dedicated file
if ! grep -q "exec Hyprland" "$HOME/.config/shell/dev-environment" 2>/dev/null; then
    cat >> "$HOME/.config/shell/dev-environment" << 'EOF'

# Auto-start Hyprland on tty1
[[ -z $DISPLAY && $(tty) == /dev/tty1 ]] && exec Hyprland
EOF
fi

echo "Hyprland auto-start added to ~/.config/shell/dev-environment"