#!/bin/bash
# Install development tools

set -e

yay -S --noconfirm --needed \
  clang llvm \
  imagemagick \
  postgresql-libs \
  github-cli \
  lazygit lazydocker \
  dbeaver \
  task \
  taskwarrior-tui