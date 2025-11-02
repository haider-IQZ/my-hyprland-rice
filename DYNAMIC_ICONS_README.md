# Dynamic Folder Icon Colors 🎨

## Overview

Your folder icons now **automatically change color** to match your wallpaper's color scheme! This uses **matugen** to extract colors from your wallpaper and intelligently selects the best matching Yaru icon theme variant.

## How It Works

```
1. You pick a wallpaper (Super + W)
2. Matugen extracts the color palette
3. Script analyzes the dominant color
4. Automatically applies matching Yaru icon variant
5. Your folders now match your wallpaper! 🎉
```

### Color Mapping

The system intelligently maps your wallpaper's dominant color to Yaru variants:

| Wallpaper Color | Icon Theme Applied |
|----------------|-------------------|
| Green tones | Yaru-sage (muted green) |
| Cyan/Teal | Yaru-prussiangreen |
| Blue tones | Yaru-blue |
| Purple tones | Yaru-purple |
| Magenta/Pink | Yaru-magenta |
| Red tones | Yaru-red |
| Orange/Brown | Yaru-wartybrown |
| Neutral/Gray | Yaru-dark |

## Usage

### Automatic (Recommended)

Just change your wallpaper normally:

```bash
# Press Super + W (or your wallpaper picker keybind)
# Select a wallpaper
# Icons automatically update to match!
```

### Manual Trigger

If you want to manually update icon colors based on current matugen colors:

```bash
dynamic-folder-colors
```

Or from the project directory:
```bash
./dynamic-folder-colors.sh
```

### Manual Override

Want to manually pick a specific color? Use the icon switcher:

```bash
~/.config/hypr/scripts/switch-icons.sh
```

## Installation

### Fresh Install

The dynamic icon system is now included in the main installer:

```bash
./install.sh
```

### Add to Existing Setup

If you already have the system installed:

```bash
# Copy the dynamic script
cp dynamic-folder-colors.sh ~/.local/bin/dynamic-folder-colors
chmod +x ~/.local/bin/dynamic-folder-colors

# Update your wallpaper picker
# (Backup first!)
cp wppicker-with-icons.sh ~/.config/hypr/scripts/wppicker.sh
```

## Requirements

- **matugen** - Color scheme generator (already in your setup)
- **yaru-icon-theme** - Icon theme with color variants
- **jq** - JSON parser (for reading matugen colors)
- **Nautilus** - File manager

All of these are installed automatically by `install.sh`.

## How the Script Works

### 1. Color Extraction
```bash
# Reads matugen's generated colors
~/.config/matugen/colors.json
```

### 2. Color Analysis
- Converts hex colors to RGB
- Determines dominant color component
- Maps to closest Yaru variant

### 3. Theme Application
- Updates GTK 3.0 settings
- Updates GTK 4.0 settings
- Applies via gsettings
- Sends notification

## Customization

### Adjust Color Mapping

Edit `dynamic-folder-colors.sh` and modify the `map_to_yaru_variant()` function:

```bash
map_to_yaru_variant() {
    local color=$1
    
    case $color in
        green)
            echo "Yaru-sage"  # Change this to your preference
            ;;
        # ... other mappings
    esac
}
```

### Change Default Fallback

If color detection fails, it defaults to `Yaru-sage`. Change this in the script:

```bash
# Find this line and change the default
ICON_THEME="Yaru-sage"  # Change to your preferred default
```

## Troubleshooting

### Icons not changing automatically

1. **Check if matugen is generating colors:**
   ```bash
   cat ~/.config/matugen/colors.json
   ```

2. **Check if dynamic script is installed:**
   ```bash
   which dynamic-folder-colors
   ```

3. **Manually run the script to see errors:**
   ```bash
   dynamic-folder-colors
   ```

### Wrong colors being selected

The script analyzes RGB values. If you want more control:

1. Check what color is being detected:
   ```bash
   dynamic-folder-colors
   # It will print: "Primary color: #XXXXXX"
   # And: "Dominant color: green/blue/etc"
   ```

2. Adjust the color detection thresholds in the script

### Icons not updating in Nautilus

```bash
# Restart Nautilus
killall nautilus

# Or restart the whole session
# Log out and log back in
```

### Matugen colors file not found

Make sure matugen has run at least once:

```bash
# Pick a wallpaper to generate colors
# Or manually run:
matugen image ~/path/to/your/wallpaper.jpg
```

## Advanced Usage

### Hook into Other Scripts

You can call `dynamic-folder-colors` from any script that changes wallpapers:

```bash
#!/bin/bash
# Your wallpaper script
swww img "$WALLPAPER"
matugen image "$WALLPAPER"

# Update folder icons
dynamic-folder-colors &
```

### Use with Other Color Schemes

If you use pywal or another color generator, modify the script to read from their config files instead of matugen.

### Disable Dynamic Colors

If you want to go back to static icons:

1. Comment out the dynamic-folder-colors call in your wallpaper picker
2. Manually set your preferred icon theme:
   ```bash
   ~/.config/hypr/scripts/switch-icons.sh
   ```

## Examples

### Anime Wallpaper (Blue/Purple tones)
- Wallpaper: Blue sky, purple clouds
- Result: `Yaru-blue` or `Yaru-purple` folders

### Nature Wallpaper (Green tones)
- Wallpaper: Forest, grass, leaves
- Result: `Yaru-sage` folders (muted green)

### Sunset Wallpaper (Orange/Red tones)
- Wallpaper: Orange sky, red sun
- Result: `Yaru-red` or `Yaru-wartybrown` folders

### Cyberpunk Wallpaper (Cyan/Magenta)
- Wallpaper: Neon cyan and magenta
- Result: `Yaru-prussiangreen` or `Yaru-magenta` folders

## Performance

The script is lightweight and runs in the background:
- Execution time: < 1 second
- No impact on wallpaper change speed
- Runs asynchronously (doesn't block)

## Credits

- **Omarchy** - Inspiration for color-matched folder icons
- **Matugen** - Color scheme generation
- **Yaru Theme** - Beautiful icon variants

## See Also

- `GREEN_ICONS_README.md` - Static green icons setup
- `QUICK_START_ICONS.md` - Quick reference guide
