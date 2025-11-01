#!/bin/bash

# Screenshot script using grim, slurp, and wl-clipboard
# Saves to ~/Pictures/Screenshots and copies to clipboard

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

# Take screenshot of selected area and save to file and clipboard
grim -g "$(slurp)" - | tee "$SCREENSHOT_DIR/$(date +%Y-%m-%d_%H-%M-%S).png" | wl-copy
