#!/bin/bash
# Install network management tools for Hyprland

set -e

echo "Installing network management tools..."

# Core NetworkManager packages
yay -S --noconfirm --needed \
  networkmanager \
  network-manager-applet \
  nm-connection-editor \
  networkmanager-openvpn \
  networkmanager-vpnc

# Bluetooth networking support
yay -S --noconfirm --needed \
  bluez \
  bluez-utils

# Additional network utilities
yay -S --noconfirm --needed \
  wpa_supplicant \
  wireless_tools \
  net-tools \
  iw \
  inetutils

echo "Network management installation completed!"
echo ""
echo "Installed tools:"
echo "  • NetworkManager - Core network management"
echo "  • network-manager-applet - System tray WiFi management"
echo "  • nm-connection-editor - GUI network configuration"
echo "  • VPN support - OpenVPN and VPNC"
echo "  • Bluetooth networking - bluez utilities"
echo "  • WiFi tools - wpa_supplicant, wireless_tools, iw"
echo ""
# Enable network services (skip in test environments)
if [ "$USER" != "testuser" ]; then
    echo "Enabling network services..."
    sudo systemctl enable --now NetworkManager
    sudo systemctl enable --now bluetooth
    echo "✅ NetworkManager and bluetooth services enabled"
else
    echo "⚠️  Test environment detected, skipping service enablement"
fi
echo ""
echo "Usage:"
echo "  • WiFi: Click network icon in system tray"
echo "  • Configuration: Run nm-connection-editor"
echo "  • CLI: Use nmcli commands"