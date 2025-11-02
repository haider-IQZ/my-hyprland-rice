# Green Folder Icons Setup (Omarchy-style)

This setup replicates Omarchy's beautiful green folder icons in Nautilus using the Yaru icon theme.

## What is Omarchy?

Omarchy is a popular Arch Linux + Hyprland distribution created by DHH (Basecamp). It features beautiful theming and uses the Yaru icon theme with color variants for folder icons.

## How it Works

Omarchy uses the **Yaru icon theme** with different color variants:
- **Yaru-sage** - Muted green (recommended, default)
- **Yaru-olive** - Olive green
- **Yaru-prussiangreen** - Prussian green
- And many other colors (blue, magenta, purple, red, etc.)

## Installation

### Option 1: Included in Main Install Script

The main `install.sh` script now automatically installs and configures green folder icons using Yaru-sage.

```bash
./install.sh
```

### Option 2: Standalone Installation

If you've already installed your system and just want to add green icons:

```bash
./setup-green-icons.sh
```

This script will:
1. Install the Yaru icon theme from AUR
2. Let you choose your preferred green variant
3. Configure GTK 3.0 and GTK 4.0 settings
4. Apply the theme system-wide

## Switching Icon Themes

After installation, you can easily switch between different Yaru color variants:

```bash
~/.config/hypr/scripts/switch-icons.sh
```

This will open a rofi menu where you can select from all available Yaru variants.

## Manual Configuration

If you want to manually set an icon theme, edit these files:

### GTK 3.0
`~/.config/gtk-3.0/settings.ini`:
```ini
[Settings]
gtk-icon-theme-name=Yaru-sage
gtk-theme-name=Adwaita-dark
gtk-application-prefer-dark-theme=1
```

### GTK 4.0
`~/.config/gtk-4.0/settings.ini`:
```ini
[Settings]
gtk-icon-theme-name=Yaru-sage
gtk-theme-name=Adwaita-dark
gtk-application-prefer-dark-theme=1
```

### Via Command Line
```bash
gsettings set org.gnome.desktop.interface icon-theme "Yaru-sage"
```

## Applying Changes

After changing the icon theme, restart Nautilus:

```bash
killall nautilus
```

Then open Nautilus again to see the new icons.

## Available Yaru Variants

- **Yaru** - Default orange/brown
- **Yaru-sage** - Muted green ✓ (recommended)
- **Yaru-olive** - Olive green ✓
- **Yaru-prussiangreen** - Prussian green ✓
- **Yaru-blue** - Blue
- **Yaru-magenta** - Magenta
- **Yaru-purple** - Purple
- **Yaru-red** - Red
- **Yaru-dark** - Dark variant

## Troubleshooting

### Icons not showing
1. Make sure yaru-icon-theme is installed: `paru -Q yaru-icon-theme`
2. Check if the theme exists: `ls ~/.local/share/icons/` or `ls /usr/share/icons/`
3. Restart Nautilus: `killall nautilus`

### Theme not applying
1. Check GTK settings: `cat ~/.config/gtk-3.0/settings.ini`
2. Try applying via gsettings: `gsettings set org.gnome.desktop.interface icon-theme "Yaru-sage"`
3. Log out and log back in

### Want a different color?
Run the icon switcher script:
```bash
~/.config/hypr/scripts/switch-icons.sh
```

## Credits

- **Omarchy** - Created by DHH (Basecamp) - [omarchy.org](https://omarchy.org)
- **Yaru Theme** - Ubuntu's default theme
- **Yaru-Colors** - Community fork with additional colors by Jannomag

## References

- [Omarchy GitHub](https://github.com/basecamp/omarchy)
- [Omarchy Manual](https://learn.omacom.io/2/the-omarchy-manual)
- [Yaru-Colors GitHub](https://github.com/Jannomag/Yaru-Colors)
