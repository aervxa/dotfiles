#!/bin/bash

CONFIG="$HOME/.config"

# Ensure destination exists
mkdir -p "$CONFIG"

# make backup of whole config incase smt goes wrong
cp -r "$CONFIG" "$CONFIG.bak"

# Make backup of hypr custom file
if [ -f "$CONFIG/hypr/hyprland/custom.conf" ]; then
  mv "$CONFIG/hypr/hyprland/custom.conf" "$CONFIG/hypr/hyprland/custom.conf.bak"
fi

# Copy all folders and files from ./config to ~/.config
cp -r ./config/* "$CONFIG"

# Remove new empty hypr custom file
if [ -f "$CONFIG/hypr/hyprland/custom.conf.bak" ]; then
  rm -f "$CONFIG/hypr/hyprland/custom.conf"
  mv "$CONFIG/hypr/hyprland/custom.conf.bak" "$CONFIG/hypr/hyprland/custom.conf"
fi
