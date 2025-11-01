#!/bin/bash

# Hyprland Rice Installation Script
# This script will install and configure a complete Hyprland setup

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_msg() {
    echo -e "${BLUE}[*]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

# Check if running on Arch Linux
if [ ! -f /etc/arch-release ]; then
    print_error "This script is designed for Arch Linux only!"
    exit 1
fi

print_msg "=== Hyprland Rice Installation Script ==="
echo ""
print_warning "This script will install packages and modify your configs"
print_warning "Your existing configs will be backed up"
echo ""
read -p "Continue? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_msg "Installation cancelled"
    exit 0
fi

# Update system
print_msg "Updating system..."
if ! sudo pacman -Syu --noconfirm; then
    print_error "System update failed"
    exit 1
fi

# Install main packages from official repos
print_msg "Installing packages from official repositories..."
if ! sudo pacman -S --needed --noconfirm \
    hyprland \
    waybar \
    foot \
    rofi \
    swww \
    swaync \
    cava \
    fastfetch \
    grim \
    slurp \
    wl-clipboard \
    playerctl \
    pavucontrol \
    blueman \
    network-manager-applet \
    hyprpicker \
    brightnessctl \
    pamixer \
    polkit-gnome \
    yazi \
    btop \
    ttf-jetbrains-mono-nerd \
    ttf-dejavu \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-hyprland; then
    print_error "Failed to install some packages from official repos"
    print_warning "Continuing anyway..."
fi

print_success "Official packages installed!"

# Install AUR helper if not present
if ! command -v paru &> /dev/null; then
    echo ""
    print_msg "Installing paru-bin (AUR helper)..."
    print_warning "This will require your input for confirmation."
    echo ""
    
    cd /tmp || exit 1
    rm -rf paru-bin
    if git clone https://aur.archlinux.org/paru-bin.git; then
        cd paru-bin || exit 1
        
        # This will ask for confirmation
        if makepkg -si; then
            print_success "paru installed successfully!"
        else
            print_error "Failed to build paru-bin!"
            exit 1
        fi
        cd /tmp || exit 1
    else
        print_error "Failed to clone paru-bin!"
        exit 1
    fi
fi

# Install AUR packages (will ask for confirmation)
echo ""
print_msg "Installing AUR packages..."
print_warning "You'll be asked to confirm each package installation."
echo ""

# Install each package separately so one failure doesn't stop everything
paru -S --needed matugen || print_warning "matugen failed or was skipped"
paru -S --needed wlogout || print_warning "wlogout failed or was skipped"

# Get the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Backup existing configs
print_msg "Backing up existing configurations..."
BACKUP_DIR="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

for dir in hypr waybar foot rofi swaync cava fastfetch wlogout matugen; do
    if [ -d "$HOME/.config/$dir" ]; then
        print_msg "Backing up $dir..."
        cp -r "$HOME/.config/$dir" "$BACKUP_DIR/" 2>/dev/null || true
    fi
done

if [ -f "$HOME/.zshrc" ]; then
    cp "$HOME/.zshrc" "$BACKUP_DIR/.zshrc" 2>/dev/null || true
fi

print_success "Backup created at $BACKUP_DIR"

# Copy dotfiles
print_msg "Installing dotfiles..."
mkdir -p "$HOME/.config"
cp -r "$SCRIPT_DIR/.config/"* "$HOME/.config/" 2>/dev/null || true

if [ -f "$SCRIPT_DIR/.zshrc" ]; then
    cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc" 2>/dev/null || true
fi

# Copy wallpapers
print_msg "Installing wallpapers..."
mkdir -p "$HOME/.config/wallpapers"
if [ -d "$SCRIPT_DIR/wallpapers" ]; then
    cp -r "$SCRIPT_DIR/wallpapers/"* "$HOME/.config/wallpapers/" 2>/dev/null || true
fi

# Fix all script shebangs (zsh -> bash)
print_msg "Fixing script shebangs..."
if [ -d "$HOME/.config/hypr/scripts" ]; then
    find "$HOME/.config/hypr/scripts/" -name "*.sh" -exec sed -i 's|#!/bin/zsh|#!/bin/bash|g' {} \; 2>/dev/null || true
fi

# Make all scripts executable
print_msg "Making scripts executable..."
if [ -d "$HOME/.config/hypr/scripts" ]; then
    chmod +x "$HOME/.config/hypr/scripts/"*.sh 2>/dev/null || true
fi

# Create screenshots directory
mkdir -p "$HOME/Pictures/Screenshots"

print_success "Dotfiles installed!"

# Apply custom modifications
print_msg "Applying custom configurations..."

# Update wallpaper picker script
if [ -f "$HOME/.config/hypr/scripts/wppicker.sh" ]; then
    cat > "$HOME/.config/hypr/scripts/wppicker.sh" << 'EOF'
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
swww img "$SELECTED_PATH" --transition-type fade --transition-duration 2
matugen image "$SELECTED_PATH"

# === CREATE SYMLINK ===
mkdir -p "$(dirname "$SYMLINK_PATH")"
ln -sf "$SELECTED_PATH" "$SYMLINK_PATH"
EOF
    chmod +x "$HOME/.config/hypr/scripts/wppicker.sh"
fi

# Update screenshot script
if [ -f "$HOME/.config/hypr/scripts/screenshot.sh" ]; then
    cat > "$HOME/.config/hypr/scripts/screenshot.sh" << 'EOF'
#!/bin/bash

# Screenshot script using grim, slurp, and wl-clipboard
# Saves to ~/Pictures/Screenshots and copies to clipboard

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

# Take screenshot of selected area and save to file and clipboard
grim -g "$(slurp)" - | tee "$SCREENSHOT_DIR/$(date +%Y-%m-%d_%H-%M-%S).png" | wl-copy
EOF
    chmod +x "$HOME/.config/hypr/scripts/screenshot.sh"
fi

# Update Waybar config to use numbers for workspaces
if [ -f "$HOME/.config/waybar/config" ]; then
    sed -i 's/"hyprland\/workspaces#kanji"/"hyprland\/workspaces#numbers"/g' "$HOME/.config/waybar/config" 2>/dev/null || true
fi

# Update pulseaudio module to open pavucontrol on click
if [ -f "$HOME/.config/waybar/Modules" ]; then
    sed -i 's/"on-click": "\$HOME\/\.config\/hypr\/scripts\/volume\.sh --toggle"/"on-click": "pavucontrol -t 3"/g' "$HOME/.config/waybar/Modules" 2>/dev/null || true
    sed -i 's/"on-click-right": "pavucontrol -t 3"/"on-click-right": "\$HOME\/\.config\/hypr\/scripts\/volume.sh --toggle"/g' "$HOME/.config/waybar/Modules" 2>/dev/null || true
fi

# Update keybinds
if [ -f "$HOME/.config/hypr/configs/keybinds.conf" ]; then
    sed -i 's/bind = \$mainMod, Q, killactive,/bind = \$mainMod, Q, exec, \$terminal/g' "$HOME/.config/hypr/configs/keybinds.conf" 2>/dev/null || true
    sed -i 's/bind = \$mainMod, C, exec, hyprpicker -a/bind = \$mainMod, C, killactive,/g' "$HOME/.config/hypr/configs/keybinds.conf" 2>/dev/null || true
    sed -i 's/bind = \$mainMod, B, exec, xdg-open "https:\/\/"  # default browser/bind = \$mainMod, X, exec, zen-browser\nbind = \$mainMod SHIFT, C, exec, hyprpicker -a/g' "$HOME/.config/hypr/configs/keybinds.conf" 2>/dev/null || true
fi

# Comment out gestures section
if [ -f "$HOME/.config/hypr/configs/input.conf" ]; then
    sed -i '/^gestures {/,/^}/s/^/#/' "$HOME/.config/hypr/configs/input.conf" 2>/dev/null || true
fi

print_success "Custom configurations applied!"

# Set initial wallpaper
print_msg "Setting initial wallpaper..."
if [ -f "$HOME/.config/wallpapers/0anime1.jpg" ]; then
    # Kill existing swww daemon if running
    pkill swww-daemon 2>/dev/null || true
    sleep 1
    swww-daemon &
    sleep 2
    swww img "$HOME/.config/wallpapers/0anime1.jpg" --transition-type fade --transition-duration 2 2>/dev/null || true
    print_success "Initial wallpaper set!"
fi

echo ""
print_success "============================================"
print_success "Installation complete!"
print_success "============================================"
echo ""
print_msg "Custom Keybinds:"
echo "  Super + Q         - Open terminal"
echo "  Super + C         - Close window"
echo "  Super + X         - Open Zen browser"
echo "  Super + W         - Wallpaper picker"
echo "  Super + D         - App launcher"
echo "  Super + R         - Reload Waybar"
echo "  Print             - Screenshot"
echo "  Super + Shift + C - Color picker"
echo ""
print_msg "Backup location: $BACKUP_DIR"
echo ""
print_warning "NEXT STEPS:"
print_warning "1. Log out of your current session"
print_warning "2. Select 'Hyprland' from your login manager"
print_warning "3. Or run 'Hyprland' from a TTY"
echo ""
