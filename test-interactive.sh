#!/bin/bash
# Interactive testing in Arch Linux container

echo "🐳 Starting interactive Arch Linux container for GeolOS testing..."

docker-compose up --build -d
echo "📱 Entering container. Run './install.sh' to test the full installation."
echo "   Or test individual scripts in the install/ directory."
echo "   Type 'exit' to leave the container."

docker-compose exec geoloc-test bash

echo "🧹 Cleaning up container..."
docker-compose down