#!/bin/bash
# Install core system utilities

set -e

yay -S --noconfirm --needed \
    wget curl unzip inetutils \
    man tldr less whois plocate \
    git chezmoi