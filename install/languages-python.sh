#!/bin/bash
# Install Python development environment

set -e

echo "Installing Python development tools..."

# Core Python packages
yay -S --noconfirm --needed \
  python \
  python-pip \
  python-virtualenv \
  pyenv

# Python development tools
yay -S --noconfirm --needed \
  ruff \
  python-isort \
  python-flake8 \
  python-mypy \
  python-pytest \
  python-ipython \
  jupyter-notebook \
  python-lsp-server \
  pyright

# Python build dependencies (often needed for packages)
yay -S --noconfirm --needed \
  python-wheel \
  python-setuptools \
  python-build \
  python-installer

# Additional useful Python tools
yay -S --noconfirm --needed \
  python-requests \
  python-click \
  python-rich \
  python-typer

echo "Python environment installation completed!"
echo ""
echo "Setting up pyenv..."

# Initialize pyenv for current user
if [ ! -d "$HOME/.pyenv" ]; then
    # Create development environment file that chezmoi can source
    mkdir -p "$HOME/.config/shell"
    
    # Add Python environment to dedicated file
    if ! grep -q "PYENV_ROOT" "$HOME/.config/shell/dev-environment" 2>/dev/null; then
        cat >> "$HOME/.config/shell/dev-environment" << 'EOF'

# Python development environment (pyenv)
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
EOF
    fi
    
    echo "Python environment added to ~/.config/shell/dev-environment"
    echo "This file will be sourced by your chezmoi-managed shell config"
fi

echo "Next steps:"
echo "  • Restart your shell to activate pyenv"
echo "  • Install Python versions: pyenv install 3.11.0"
echo "  • Set global version: pyenv global 3.11.0"
echo "  • Create virtual environments: python -m venv myproject"
echo "  • Or use poetry: poetry new myproject"

