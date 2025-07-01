#!/bin/bash
# Install Go development environment

set -e

echo "Installing Go development tools..."

# Core Go packages
yay -S --noconfirm --needed \
  go \
  gofumpt \
  golangci-lint \
  delve

# Go development tools and utilities
echo "Installing Go development tools via go install..."

# Set up Go environment first
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Create Go directories
mkdir -p "$GOPATH/bin"
mkdir -p "$GOPATH/src"
mkdir -p "$GOPATH/pkg"

# Install Go tools
go install golang.org/x/tools/gopls@latest                            # Go language server
go install golang.org/x/tools/cmd/goimports@latest                    # Import formatter
go install github.com/go-delve/delve/cmd/dlv@latest                   # Debugger
go install honnef.co/go/tools/cmd/staticcheck@latest                  # Static analyzer
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest # Linter
go install github.com/air-verse/air@latest                            # Live reload
go install github.com/swaggo/swag/cmd/swag@latest                     # Swagger generator
go install github.com/pressly/goose/v3/cmd/goose@latest               # Database migrations
go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest                   # SQL code generator

# Popular Go CLI tools
go install github.com/spf13/cobra-cli@latest       # CLI app generator
go install github.com/goreleaser/goreleaser@latest # Release automation

echo "Go environment installation completed!"
echo ""
echo "Setting up Go environment variables..."

# Create development environment file that chezmoi can source
mkdir -p "$HOME/.config/shell"

# Add Go environment to dedicated file
if ! grep -q "GOPATH" "$HOME/.config/shell/dev-environment" 2>/dev/null; then
    cat >> "$HOME/.config/shell/dev-environment" << 'EOF'

# Go development environment
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
EOF
fi

echo "Go environment added to ~/.config/shell/dev-environment"
echo "This file will be sourced by your chezmoi-managed shell config"

echo ""
echo "Installed Go tools:"
echo "  • go - Go compiler and toolchain"
echo "  • gopls - Go language server for editors"
echo "  • goimports - Import formatter"
echo "  • dlv (delve) - Go debugger"
echo "  • staticcheck - Static analysis tool"
echo "  • golangci-lint - Comprehensive linter"
echo "  • air - Live reload for development"
echo "  • swag - Swagger documentation generator"
echo "  • goose - Database migration tool"
echo "  • sqlc - SQL code generator"
echo "  • cobra-cli - CLI application generator"
echo "  • goreleaser - Release automation"
echo ""
echo "Environment setup:"
echo "  • GOPATH: $HOME/go"
echo "  • Go binaries: $HOME/go/bin"
echo ""

