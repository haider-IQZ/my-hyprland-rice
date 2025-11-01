#!/bin/bash

# === CONFIG ===
WALLPAPER_DIR="$HOME/.config/wallpapers"
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper"

cd "$WALLPAPER_DIR" || exit 1

# === handle spaces name
IFS=$'\n'

# === ICON-PREVIEW SELECTION WITH ROFI, SORTED BY NEWEST ===
SELECTED=$(for a in $(ls -t *.jpg *.png *.gif *.jpeg 2>/dev/null); do echo -en "$a\x00icon\x1f$WALLPAPER_DIR/$a\n"; done | rofi -dmenu -i -p "Select Wallpaper" -theme-str 'window {width: 70%; height: 75%;} listview {columns: 4; lines: 3;} element {orientation: vertical;} element-icon {size: 12em;} element-text {horizontal-align: 0.5;}')
[ -z "$SELECTED" ] && exit 1
SELECTED_PATH="$WALLPAPER_DIR/$SELECTED"

# === SET WALLPAPER ===
matugen image "$SELECTED_PATH"

# === CREATE SYMLINK ===
mkdir -p "$(dirname "$SYMLINK_PATH")"
ln -sf "$SELECTED_PATH" "$SYMLINK_PATH"

