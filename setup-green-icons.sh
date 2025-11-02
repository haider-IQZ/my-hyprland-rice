#!/bin/bash

# Green Folder Icons Setup Script (Omarchy-style)
# This script installs Yaru icon themes with green folder variants

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

echo ""
print_msg "=== Green Folder Icons Setup (Omarchy-style) ==="
echo ""
print_msg "This will install Yaru icon themes with green folders"
print_msg "You can choose between Yaru-sage (muted green) or Yaru-olive (olive green)"
echo ""

# Check if running on Arch Linux
if [ ! -f /etc/arch-release ]; then
    print_error "This script is designed for Arch Linux only!"
    exit 1
fi

# Install Yaru icon theme from AUR
print_msg "Installing Yaru icon theme from AUR..."

# Check if paru is installed
if ! command -v paru &> /dev/null; then
    print_error "paru is not installed. Please install it first or run the main install.sh script."
    exit 1
fi

# Install yaru-icon-theme
if paru -S --needed yaru-icon-theme; then
    print_success "Yaru icon theme installed!"
else
    print_warning "Failed to install yaru-icon-theme, trying alternative method..."
    
    # Try installing from git
    print_msg "Cloning Yaru-Colors repository..."
    cd /tmp || exit 1
    rm -rf Yaru-Colors
    
    if git clone https://github.com/Jannomag/Yaru-Colors.git; then
        cd Yaru-Colors || exit 1
        
        # Install to user's icon directory
        mkdir -p "$HOME/.local/share/icons"
        
        # Copy the icon themes
        print_msg "Installing icon themes..."
        cp -r Icons/Yaru* "$HOME/.local/share/icons/" 2>/dev/null || true
        
        print_success "Yaru icon themes installed to ~/.local/share/icons"
    else
        print_error "Failed to clone Yaru-Colors repository"
        exit 1
    fi
fi

# Let user choose which green variant
echo ""
print_msg "Choose your green folder icon variant:"
echo "  1) Yaru-sage (muted green - recommended)"
echo "  2) Yaru-olive (olive green)"
echo "  3) Yaru-prussiangreen (prussian green)"
echo ""
read -p "Enter your choice (1-3): " -n 1 -r
echo ""

case $REPLY in
    1)
        ICON_THEME="Yaru-sage"
        print_msg "Selected: Yaru-sage (muted green)"
        ;;
    2)
        ICON_THEME="Yaru-olive"
        print_msg "Selected: Yaru-olive (olive green)"
        ;;
    3)
        ICON_THEME="Yaru-prussiangreen"
        print_msg "Selected: Yaru-prussiangreen"
        ;;
    *)
        ICON_THEME="Yaru-sage"
        print_warning "Invalid choice, defaulting to Yaru-sage"
        ;;
esac

# Configure GTK to use the selected icon theme
print_msg "Configuring GTK settings..."

# Create GTK config directories if they don't exist
mkdir -p "$HOME/.config/gtk-3.0"
mkdir -p "$HOME/.config/gtk-4.0"

# GTK 3.0 settings
GTK3_SETTINGS="$HOME/.config/gtk-3.0/settings.ini"
if [ -f "$GTK3_SETTINGS" ]; then
    # Backup existing settings
    cp "$GTK3_SETTINGS" "$GTK3_SETTINGS.backup"
    print_msg "Backed up existing GTK 3.0 settings"
    
    # Update icon theme setting
    if grep -q "gtk-icon-theme-name" "$GTK3_SETTINGS"; then
        sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=$ICON_THEME/" "$GTK3_SETTINGS"
    else
        echo "gtk-icon-theme-name=$ICON_THEME" >> "$GTK3_SETTINGS"
    fi
else
    # Create new settings file
    cat > "$GTK3_SETTINGS" << EOF
[Settings]
gtk-icon-theme-name=$ICON_THEME
gtk-theme-name=Adwaita-dark
gtk-application-prefer-dark-theme=1
EOF
fi

# GTK 4.0 settings
GTK4_SETTINGS="$HOME/.config/gtk-4.0/settings.ini"
if [ -f "$GTK4_SETTINGS" ]; then
    # Backup existing settings
    cp "$GTK4_SETTINGS" "$GTK4_SETTINGS.backup"
    print_msg "Backed up existing GTK 4.0 settings"
    
    # Update icon theme setting
    if grep -q "gtk-icon-theme-name" "$GTK4_SETTINGS"; then
        sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=$ICON_THEME/" "$GTK4_SETTINGS"
    else
        echo "gtk-icon-theme-name=$ICON_THEME" >> "$GTK4_SETTINGS"
    fi
else
    # Create new settings file
    cat > "$GTK4_SETTINGS" << EOF
[Settings]
gtk-icon-theme-name=$ICON_THEME
gtk-theme-name=Adwaita-dark
gtk-application-prefer-dark-theme=1
EOF
fi

print_success "GTK settings configured!"

# Also set via gsettings if available
if command -v gsettings &> /dev/null; then
    print_msg "Applying settings via gsettings..."
    gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME" 2>/dev/null || true
    print_success "gsettings updated!"
fi

# Create a script to easily switch between icon themes
print_msg "Creating icon theme switcher script..."
cat > "$HOME/.config/hypr/scripts/switch-icons.sh" << 'EOFSCRIPT'
#!/bin/bash

# Icon Theme Switcher for Yaru variants

THEMES=(
    "Yaru-sage"
    "Yaru-olive"
    "Yaru-prussiangreen"
    "Yaru-blue"
    "Yaru-magenta"
    "Yaru-purple"
    "Yaru-red"
    "Yaru"
)

# Use rofi to select theme
SELECTED=$(printf '%s\n' "${THEMES[@]}" | rofi -dmenu -i -p "Select Icon Theme")

if [ -n "$SELECTED" ]; then
    # Update GTK 3.0
    sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=$SELECTED/" "$HOME/.config/gtk-3.0/settings.ini"
    
    # Update GTK 4.0
    sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=$SELECTED/" "$HOME/.config/gtk-4.0/settings.ini"
    
    # Update via gsettings
    if command -v gsettings &> /dev/null; then
        gsettings set org.gnome.desktop.interface icon-theme "$SELECTED"
    fi
    
    notify-send "Icon Theme Changed" "Now using: $SELECTED\nRestart apps to see changes"
fi
EOFSCRIPT

chmod +x "$HOME/.config/hypr/scripts/switch-icons.sh"
print_success "Icon theme switcher created at ~/.config/hypr/scripts/switch-icons.sh"

echo ""
print_success "============================================"
print_success "Green folder icons setup complete!"
print_success "============================================"
echo ""
print_msg "Icon theme applied: $ICON_THEME"
echo ""
print_warning "IMPORTANT: You need to restart Nautilus to see the changes"
print_msg "Run: killall nautilus"
print_msg "Then open Nautilus again"
echo ""
print_msg "To switch icon themes later, run:"
print_msg "  ~/.config/hypr/scripts/switch-icons.sh"
echo ""
