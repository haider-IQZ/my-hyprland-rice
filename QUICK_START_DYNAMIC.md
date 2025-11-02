# Quick Start: Dynamic Folder Icon Colors 🎨

## What Is This?

Your folder icons **automatically change color** to match your wallpaper! 

When you change wallpapers, the system:
1. Extracts colors using **matugen** (the "d" tool you mentioned!)
2. Analyzes the dominant color
3. Applies matching Yaru icon theme
4. Your folders now match your aesthetic! ✨

---

## 🚀 Installation

### New Install
```bash
cd /home/haider/CascadeProjects/arch-hyprland
./install.sh
```
✓ Dynamic icons included automatically!

### Already Installed?
```bash
cd /home/haider/CascadeProjects/arch-hyprland
./setup-green-icons.sh
# Then copy the dynamic script:
cp dynamic-folder-colors.sh ~/.local/bin/dynamic-folder-colors
chmod +x ~/.local/bin/dynamic-folder-colors
```

---

## 🎯 How to Use

### Automatic (Just Change Wallpaper!)

Press `Super + W` → Pick wallpaper → **Icons auto-update!** 🎉

That's it! The system does everything automatically.

### Manual Update

If you want to manually refresh icon colors:
```bash
dynamic-folder-colors
```

### Pick Specific Color

Want to override and choose manually?
```bash
~/.config/hypr/scripts/switch-icons.sh
```

---

## 🌈 Color Examples

| Your Wallpaper | Folder Color Result |
|---------------|-------------------|
| 🌊 Ocean/Blue sky | Blue folders |
| 🌲 Forest/Nature | Green folders |
| 🌅 Sunset/Fire | Red/Orange folders |
| 💜 Purple aesthetic | Purple folders |
| 🎮 Cyberpunk cyan | Cyan/Teal folders |
| 🌸 Pink/Magenta | Magenta folders |

---

## ⚡ Quick Commands

```bash
# Change wallpaper (auto-updates icons)
Super + W

# Manually update icon colors
dynamic-folder-colors

# Choose specific icon color
~/.config/hypr/scripts/switch-icons.sh

# Restart Nautilus to see changes
killall nautilus
```

---

## 🔧 How It Works

```
Wallpaper Change
    ↓
Matugen extracts colors
    ↓
Script analyzes dominant color
    ↓
Selects matching Yaru variant
    ↓
Updates GTK settings
    ↓
Folders match your wallpaper! ✨
```

---

## 📋 Requirements

All installed automatically by `install.sh`:
- ✓ matugen (color extraction)
- ✓ yaru-icon-theme (colored folders)
- ✓ jq (JSON parsing)
- ✓ Nautilus (file manager)

---

## 🐛 Troubleshooting

### Icons not changing?
```bash
# Check if matugen generated colors
cat ~/.config/matugen/colors.json

# Manually run to see errors
dynamic-folder-colors
```

### Wrong colors?
```bash
# See what color was detected
dynamic-folder-colors
# Shows: "Primary color: #XXXXXX"
# Shows: "Dominant color: green/blue/etc"
```

### Need to restart Nautilus?
```bash
killall nautilus
# Then open Nautilus again
```

---

## 💡 Pro Tips

1. **Best wallpapers**: Use wallpapers with clear dominant colors
2. **Manual override**: Use the switcher if auto-selection isn't perfect
3. **Notification**: You'll get a notification when icons change
4. **Instant preview**: Restart Nautilus to see changes immediately

---

## 📚 More Info

- Full docs: `DYNAMIC_ICONS_README.md`
- Static icons: `GREEN_ICONS_README.md`
- General guide: `QUICK_START_ICONS.md`

---

## 🎨 Enjoy Your Dynamic Setup!

Your system now adapts to your aesthetic automatically. Every wallpaper change brings a cohesive, color-matched experience! 🚀
