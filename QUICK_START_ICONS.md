# Quick Start: Green Folder Icons

## 🚀 Fast Setup (If you haven't installed yet)

Just run the main install script - green icons are now included:

```bash
cd /home/haider/CascadeProjects/arch-hyprland
./install.sh
```

The installer will automatically set up **Yaru-sage** (muted green) folder icons.

---

## 🎨 Already Installed? Add Green Icons Now

Run the standalone setup script:

```bash
cd /home/haider/CascadeProjects/arch-hyprland
./setup-green-icons.sh
```

You'll be able to choose from:
1. **Yaru-sage** (muted green) - Recommended ✓
2. **Yaru-olive** (olive green)
3. **Yaru-prussiangreen** (prussian green)

---

## 🔄 Switch Icon Colors Anytime

Use the icon theme switcher (installed automatically):

```bash
~/.config/hypr/scripts/switch-icons.sh
```

This opens a rofi menu with all available Yaru color variants.

---

## ✅ Apply Changes

After changing icons, restart Nautilus:

```bash
killall nautilus
```

Then open Nautilus from your app launcher or run: `nautilus`

---

## 📝 What You Get

- **Green folder icons** in Nautilus (just like Omarchy)
- **Yaru icon theme** with multiple color variants
- **Easy switcher script** to change colors anytime
- **Automatic GTK configuration** for both GTK 3.0 and 4.0

---

## 🎯 How Omarchy Does It

Omarchy uses the Yaru icon theme (Ubuntu's default) with color variants. Each theme can specify which icon color to use by creating an `icons.theme` file with the variant name (e.g., "Yaru-sage").

We've replicated this by:
1. Installing the Yaru icon theme from AUR
2. Configuring GTK to use the green variant (Yaru-sage)
3. Providing an easy switcher to change colors

---

## 🆘 Need Help?

See the full documentation in `GREEN_ICONS_README.md`
