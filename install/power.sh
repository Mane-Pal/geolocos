#!/bin/bash
# Install power management tools

set -e

# Setting the performance profile can make a big difference. By default, most systems seem to start in balanced mode,
# even if they're not running off a battery. So let's make sure that's changed to performance.
yay -S --noconfirm power-profiles-daemon

# Skip power profile configuration in test environment or if daemon isn't available
if [ "$USER" = "testuser" ]; then
  echo "Test environment detected, skipping power profile configuration"
elif ! powerprofilesctl list >/dev/null 2>&1; then
  echo "Power profiles daemon not available, skipping profile configuration"
  echo "Note: Run 'sudo systemctl enable --now power-profiles-daemon' after installation"
else
  if ls /sys/class/power_supply/BAT* &>/dev/null; then
    # This computer runs on a battery
    powerprofilesctl set balanced
    echo "Set power profile to balanced (battery detected)"
  else
    # This computer runs on power outlet  
    powerprofilesctl set performance
    echo "Set power profile to performance (no battery detected)"
  fi
fi
