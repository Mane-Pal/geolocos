#!/bin/bash
# Install terminal and CLI tools

set -e

yay -S --noconfirm --needed \
  wezterm tmux \
  eza fzf ripgrep zoxide bat \
  fastfetch btop \
  nmtui wl-clipboard

if ! command -v nvim &>/dev/null; then
  yay -S --noconfirm --needed nvim luarocks tree-sitter-cli
fi
