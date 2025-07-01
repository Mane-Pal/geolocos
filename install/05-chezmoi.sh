#!/bin/bash
# Setup chezmoi and dotfiles

set -e

# Initialize chezmoi with your dotfiles repo
# Update this URL with your actual chezmoi repo when you push it
CHEZMOI_REPO="https://github.com/Mane-Pal/dotfiles"

echo "Setting up dotfiles with chezmoi..."

if [ ! -d ~/.local/share/chezmoi ]; then
    echo "Initializing chezmoi with $CHEZMOI_REPO"
    chezmoi init --apply $CHEZMOI_REPO
else
    echo "Updating existing chezmoi configuration"
    chezmoi update
fi

# Deploy and make bin scripts executable
mkdir -p ~/.local/bin
if [ -d ~/.local/share/chezmoi/bin ]; then
    cp ~/.local/share/chezmoi/bin/* ~/.local/bin/ 2>/dev/null || true
    chmod +x ~/.local/bin/* 2>/dev/null || true
    echo "✅ Bin scripts deployed to ~/.local/bin/"
else
    echo "⚠️  No bin scripts found in chezmoi"
fi

echo "✅ Dotfiles setup completed!"
echo "💡 Use 'theme-set <theme_name>' to switch themes"
echo "💡 Available themes: catppuccin, everforest, gruvbox, kanagawa, nord, tokyo-night"