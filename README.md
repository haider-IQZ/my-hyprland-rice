# MY HYPRLAND RICE

A complete Hyprland desktop environment setup with automatic color scheme generation, custom wallpaper picker, and beautiful UI.

![Screenshot](https://github.com/user-attachments/assets/cdfc60a8-9241-4633-bc23-8d80ebe9f862)

## Features

- 🎨 **Automatic theming** with Matugen - colors adapt to your wallpaper
- 🖼️ **Beautiful wallpaper picker** with rofi and image previews
- ⚡ **Optimized Waybar** with custom modules and styling
- 📸 **Screenshot tool** with area selection (saves + copies to clipboard)
- 🎵 **Media controls** with playerctl integration
- 🔔 **Notification center** with swaync
- 🌊 **Smooth animations** and transitions
- ⌨️ **Custom keybinds** for productivity

## Quick Install

**For Arch Linux only:**

```bash
git clone https://github.com/haider-IQZ/my-hyprland-rice.git
cd my-hyprland-rice
chmod +x install.sh
./install.sh
```

The script will:
- Install all required packages (from official repos and AUR)
- Backup your existing configs
- Copy all dotfiles to `~/.config/`
- Apply custom configurations
- Set up wallpapers and scripts

## What's Included

### Core Components
- **Hyprland** - Wayland compositor
- **Waybar** - Status bar with custom modules
- **Kitty** - Terminal emulator
- **Rofi** - Application launcher & wallpaper picker
- **swww** - Wallpaper manager with transitions
- **Matugen** - Color scheme generator

### Tools & Utilities
- **grim + slurp** - Screenshot tools
- **wl-clipboard** - Clipboard manager
- **swaync** - Notification daemon
- **wlogout** - Logout menu
- **hyprpicker** - Color picker
- **brightnessctl** - Brightness control
- **pamixer** - Volume control
- **playerctl** - Media player control
- **yazi** - File manager
- **btop** - System monitor
- **cava** - Audio visualizer

## Custom Keybinds

| Keybind | Action |
|---------|--------|
| `Super + Q` | Open terminal |
| `Super + C` | Close window |
| `Super + X` | Open Zen browser |
| `Super + W` | Wallpaper picker |
| `Super + D` | App launcher (rofi) |
| `Super + R` | Reload Waybar |
| `Super + E` | File manager |
| `Super + L` | Lock screen |
| `Print` | Screenshot (area selection) |
| `Super + Shift + C` | Color picker |
| `Super + Shift + F` | Fullscreen |
| `Super + Space` | Toggle floating |

## Wallpaper Management

1. Add wallpapers to `~/.config/wallpapers/`
2. Press `Super + W` to open the picker
3. Select a wallpaper - theme colors will automatically update!

Supported formats: `.jpg`, `.jpeg`, `.png`, `.gif`

## Waybar Modules

- **Clock** - Time and date
- **Workspaces** - Numbered workspace indicators
- **Battery** - Battery status and percentage
- **Audio** - Volume control (click to open pavucontrol)
- **Network** - Connection status
- **Notifications** - Notification center
- **Power** - Logout menu

## Configuration

All configs are in `~/.config/`:
- `hypr/` - Hyprland configuration
- `waybar/` - Waybar config and styles
- `kitty/` - Terminal config
- `rofi/` - Launcher config
- `swaync/` - Notification config
- `wlogout/` - Logout menu config

## Troubleshooting

**Waybar not showing:**
```bash
Super + R  # Reload Waybar
```

**No wallpaper:**
```bash
swww-daemon &
swww img ~/.config/wallpapers/your-wallpaper.jpg
```

**Scripts not working:**
```bash
chmod +x ~/.config/hypr/scripts/*.sh
```

## Credits

- Original rice inspiration from [binnewbs](https://github.com/binnewbs/arch-hyprland)
- Waybar configs and scripts from [JaKooLit](https://github.com/JaKooLit)
- Color scheme generation by [Matugen](https://github.com/InioX/matugen)

## License

Feel free to use and modify as you like!

<img width="1920" height="1080" alt="20250720_22h08m02s_grim" src="https://github.com/user-attachments/assets/cdfc60a8-9241-4633-bc23-8d80ebe9f862" />

<img width="1920" height="1080" alt="20250720_22h10m55s_grim" src="https://github.com/user-attachments/assets/66696b8b-d479-4884-b10b-1920ae8b21a2" />


