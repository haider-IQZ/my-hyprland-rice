# 🎨 Dynamic Folder Icons - Complete Implementation

## What You Asked For

> "i use something starts with d to match the colors with the wallpaper i pick"

You're using **matugen** (the "d" tool) to generate color schemes from wallpapers!

## What I Built

A complete **dynamic folder icon system** that automatically changes your Nautilus folder colors to match your wallpaper's color scheme - just like Omarchy does!

---

## 📦 Files Created

### Core Scripts
1. **`dynamic-folder-colors.sh`** - Main script that analyzes matugen colors and applies matching icon theme
2. **`setup-green-icons.sh`** - Standalone installer for Yaru icons with color selection
3. **`wppicker-with-icons.sh`** - Enhanced wallpaper picker with auto icon updates

### Documentation
1. **`DYNAMIC_ICONS_README.md`** - Complete technical documentation
2. **`QUICK_START_DYNAMIC.md`** - Quick reference guide
3. **`GREEN_ICONS_README.md`** - Static green icons guide
4. **`QUICK_START_ICONS.md`** - Original quick start

### Updated Files
- **`install.sh`** - Now includes dynamic icon system, jq package, and updated wallpaper picker

---

## 🚀 How It Works

```
┌─────────────────────┐
│  Change Wallpaper   │
│    (Super + W)      │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  Matugen Extracts   │
│   Color Palette     │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Analyze Dominant    │
│      Color          │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  Map to Yaru Icon   │
│      Variant        │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  Update GTK Theme   │
│   (Auto-applied)    │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Folders Match Your  │
│    Wallpaper! 🎉    │
└─────────────────────┘
```

---

## 🎨 Color Mapping Intelligence

The system analyzes RGB values and maps to Yaru variants:

| Detected Color | Icon Theme | Example Wallpapers |
|---------------|------------|-------------------|
| Green dominant | Yaru-sage | Forest, nature, grass |
| Cyan/Teal | Yaru-prussiangreen | Ocean, cyberpunk |
| Blue dominant | Yaru-blue | Sky, water, blue aesthetic |
| Purple dominant | Yaru-purple | Purple aesthetic, space |
| Magenta/Pink | Yaru-magenta | Pink aesthetic, sunset |
| Red dominant | Yaru-red | Fire, red aesthetic |
| Orange/Brown | Yaru-wartybrown | Sunset, autumn, warm tones |
| Neutral/Gray | Yaru-dark | Minimal, dark aesthetic |

---

## 📥 Installation

### Fresh Install (Recommended)
```bash
cd /home/haider/CascadeProjects/arch-hyprland
./install.sh
```
✓ Everything included automatically!

### Add to Existing System
```bash
cd /home/haider/CascadeProjects/arch-hyprland

# Install dynamic script
cp dynamic-folder-colors.sh ~/.local/bin/dynamic-folder-colors
chmod +x ~/.local/bin/dynamic-folder-colors

# Install Yaru icons (if not already)
./setup-green-icons.sh
```

---

## 🎯 Usage

### Automatic (Recommended)
Just change your wallpaper normally:
```bash
Super + W  # Pick wallpaper
# Icons automatically update! ✨
```

### Manual Commands
```bash
# Manually update icon colors
dynamic-folder-colors

# Choose specific color manually
~/.config/hypr/scripts/switch-icons.sh

# Restart Nautilus to see changes
killall nautilus
```

---

## 🔧 Technical Details

### Dependencies (Auto-installed)
- `matugen` - Color scheme generator (AUR)
- `yaru-icon-theme` - Icon theme with color variants (AUR)
- `jq` - JSON parser for reading matugen colors
- `nautilus` - File manager

### Configuration Files Modified
- `~/.config/gtk-3.0/settings.ini` - GTK 3 icon theme
- `~/.config/gtk-4.0/settings.ini` - GTK 4 icon theme
- `~/.config/hypr/scripts/wppicker.sh` - Wallpaper picker with auto icons

### Script Location
- Installed to: `~/.local/bin/dynamic-folder-colors`
- Source: `/home/haider/CascadeProjects/arch-hyprland/dynamic-folder-colors.sh`

---

## 🎭 Comparison: Before vs After

### Before
- Static green folder icons (Yaru-sage)
- Manual color changes only
- No integration with wallpaper changes

### After
- ✅ **Dynamic** folder colors that match wallpaper
- ✅ **Automatic** updates when changing wallpaper
- ✅ **Intelligent** color detection and mapping
- ✅ **Seamless** integration with matugen workflow
- ✅ **Manual override** option still available

---

## 🌟 Features

1. **Fully Automatic** - Just change wallpaper, icons update
2. **Smart Color Detection** - Analyzes RGB to find dominant color
3. **8 Color Variants** - Covers all major color schemes
4. **Notification Support** - Get notified when icons change
5. **Fallback Safe** - Defaults to green if detection fails
6. **Manual Override** - Can still pick colors manually
7. **GTK 3 & 4 Support** - Works with all GTK apps
8. **Background Execution** - Doesn't slow down wallpaper changes

---

## 📚 Documentation

- **Quick Start**: Read `QUICK_START_DYNAMIC.md`
- **Full Guide**: Read `DYNAMIC_ICONS_README.md`
- **Static Icons**: Read `GREEN_ICONS_README.md`
- **Troubleshooting**: All docs include troubleshooting sections

---

## 🎉 Result

You now have a **fully dynamic, color-matched desktop** where:
- Wallpaper colors → Matugen extracts → Folder icons match
- Everything happens automatically
- Your aesthetic stays cohesive
- Just like Omarchy, but integrated with YOUR setup!

---

## 🙏 Credits

- **Omarchy** by DHH - Inspiration for color-matched icons
- **Matugen** - Dynamic color scheme generation
- **Yaru Theme** - Beautiful icon variants
- **Your Request** - For asking about dynamic color matching!

---

## 🚀 Next Steps

1. Run `./install.sh` (or add to existing system)
2. Change a wallpaper (Super + W)
3. Watch your folder icons automatically match! ✨
4. Enjoy your cohesive, dynamic aesthetic!

---

**Enjoy your dynamic, color-matched Hyprland setup!** 🎨🚀
