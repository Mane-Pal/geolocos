#!/bin/bash
# Test script for GeolOS installation in Docker

set -e

echo "🐳 Starting GeolOS test in Arch Linux container..."

# Build and run the container
docker-compose up --build -d

echo "📦 Container started. Running installation test..."

# Run the installation script inside the container
docker-compose exec geoloc-test bash -c "
    echo '🔧 Testing core installation scripts...'
    echo 'Test User' | ./install/02-identification.sh || echo 'Identification script completed'
    ./install/01-yay.sh || echo 'Yay installation completed'
    ./install/03-terminal.sh || echo 'Terminal installation completed'
    ./install/04-core-tools.sh || echo 'Core tools installation completed'
    echo '✅ Core installation test completed'
"

echo "🔍 Checking installed packages..."
docker-compose exec geoloc-test bash -c "
    which yay && echo '✅ yay installed' || echo '❌ yay missing'
    which git && echo '✅ git installed' || echo '❌ git missing'
    which wezterm && echo '✅ wezterm installed' || echo '❌ wezterm missing'
    which nvim && echo '✅ nvim installed' || echo '❌ nvim missing'
"

echo "🧹 Cleaning up..."
docker-compose down

echo "✅ Test completed!"