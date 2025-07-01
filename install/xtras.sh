#!/bin/bash
# Install extra applications

set -e

yay -S --noconfirm --needed \
  spotify \
  obsidian typora libreoffice \
  gimp xournalpp slack-desktop-wayland
