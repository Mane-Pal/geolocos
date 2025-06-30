#!/bin/bash
# Install desktop applications

set -e

yay -S --noconfirm --needed \
  brightnessctl playerctl pamixer pavucontrol wireplumber \
  wl-clip-persist clipse \
  nautilus sushi \
  brave-bin zen-browser-bin vlc \
  evince imv
