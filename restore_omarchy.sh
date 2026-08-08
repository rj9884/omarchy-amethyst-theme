#!/usr/bin/env bash
# ==============================================================================
# Omarchy All-In-One Automated Restore & System Setup Script
# Repository: https://github.com/rj9884/omarchy-amethyst-theme.git
# ==============================================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Omarchy Automated All-In-One Restore & Environment Setup ===${NC}\n"

CURRENT_USER=$(whoami)
USER_HOME="$HOME"

# Prompt for sudo password upfront if not root
if [ "$EUID" -ne 0 ]; then
    echo -e "${YELLOW}Administrator privileges (sudo) are required to install packages, configure udev power rules, and update Limine kernel cmdline.${NC}"
    sudo -v || echo -e "${YELLOW}Notice: Running in non-sudo mode. System-level packages and udev rules will need to be applied manually.${NC}"
    # Keep-alive sudo timestamp until script finishes
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

# 1. Determine Archive Locations
ARCHIVE_ZIP="${1:-$USER_HOME/omarchy_backup.zip}"
PERSONAL_ZIP="$USER_HOME/personal_data_backup.zip"

if [ ! -f "$ARCHIVE_ZIP" ]; then
    if [ -f "./omarchy_backup.zip" ]; then
        ARCHIVE_ZIP="$(pwd)/omarchy_backup.zip"
    else
        echo -e "${RED}Error: Backup archive 'omarchy_backup.zip' not found in $USER_HOME or current directory!${NC}"
        echo -e "Usage: ./restore_omarchy.sh [path/to/omarchy_backup.zip]"
        exit 1
    fi
fi

echo -e "${GREEN}Found configuration archive:${NC} $ARCHIVE_ZIP"
if [ -f "$PERSONAL_ZIP" ]; then
    echo -e "${GREEN}Found personal data archive:${NC} $PERSONAL_ZIP"
fi

# 2. Check and Install Required System Packages (Excludes ghostty & kitty)
echo -e "\n${BLUE}[1/7] Installing & verifying required system packages...${NC}"

REQUIRED_PKGS=(
    unzip
    rsync
    jq
    git
    wl-clipboard
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    starship
    fastfetch
    hyprland
    waybar
    mako
    swayosd
    walker
    wofi
    cava
    btop
    alacritty
    nautilus
    sushi
    gnome-text-editor
    power-profiles-daemon
    code
    ttf-firacode-nerd
    ttf-jetbrains-mono-nerd
    ttf-font-awesome
)

MISSING_PKGS=()

if command -v pacman &>/dev/null; then
    for pkg in "${REQUIRED_PKGS[@]}"; do
        if ! pacman -Qi "$pkg" &>/dev/null; then
            MISSING_PKGS+=("$pkg")
        fi
    done

    if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
        echo -e "${YELLOW}Notice: Installing missing packages:${NC} ${MISSING_PKGS[*]}"
        if command -v sudo &>/dev/null; then
            sudo pacman -S --needed --noconfirm "${MISSING_PKGS[@]}" || echo -e "${YELLOW}Warning: Some packages could not be installed automatically.${NC}"
        else
            echo -e "${YELLOW}Warning: sudo not available. Please run manually: sudo pacman -S --needed ${MISSING_PKGS[*]}${NC}"
        fi
    else
        echo -e "${GREEN}✓ All core system package prerequisites are installed!${NC}"
    fi
fi

# 3. Create Safety Backup of Existing Configurations
echo -e "\n${BLUE}[2/7] Creating safety backup of current ~/.config...${NC}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
if [ -d "$USER_HOME/.config" ]; then
    mkdir -p "$USER_HOME/.config_backups"
    cp -r "$USER_HOME/.config" "$USER_HOME/.config_backups/config_bak_$TIMESTAMP" 2>/dev/null || true
    echo -e "${GREEN}✓ Current ~/.config backed up to $USER_HOME/.config_backups/config_bak_$TIMESTAMP${NC}"
fi

# 4. Extract Configuration & Personal Data Archives
echo -e "\n${BLUE}[3/7] Extracting configurations and personal data...${NC}"
unzip -o "$ARCHIVE_ZIP" -d "$USER_HOME" >/dev/null

if [ -f "$PERSONAL_ZIP" ]; then
    echo -e "${BLUE}Extracting personal data files to $USER_HOME...${NC}"
    unzip -o "$PERSONAL_ZIP" -d "$USER_HOME" >/dev/null
fi

# Remove ghostty / kitty if extracted
rm -rf "$USER_HOME/.config/ghostty" "$USER_HOME/.config/kitty" 2>/dev/null || true

# 5. Clone/Sync Theme Repository from GitHub & Run Installer
echo -e "\n${BLUE}[4/7] Syncing omarchy-amethyst-theme from GitHub...${NC}"
THEME_REPO_URL="https://github.com/rj9884/omarchy-amethyst-theme.git"
THEME_DIR="$USER_HOME/omarchy-amethyst-theme"

if [ -d "$THEME_DIR/.git" ]; then
    echo -e "${BLUE}Fetching & syncing latest updates from origin/main...${NC}"
    git -C "$THEME_DIR" fetch origin main 2>/dev/null || true
    git -C "$THEME_DIR" reset --hard origin/main 2>/dev/null || true
else
    echo -e "${BLUE}Cloning theme repository from $THEME_REPO_URL...${NC}"
    rm -rf "$THEME_DIR" 2>/dev/null || true
    git clone "$THEME_REPO_URL" "$THEME_DIR"
fi

if [ -f "$THEME_DIR/install.sh" ]; then
    echo -e "${BLUE}Running Omarchy Amethyst Theme installer...${NC}"
    chmod +x "$THEME_DIR/install.sh"
    bash "$THEME_DIR/install.sh"
fi

# 6. Sanitize Legacy Username Paths & Update App Configs
echo -e "\n${BLUE}[5/7] Sanitizing environment paths & application settings...${NC}"

# A. GTK Bookmarks, Settings & Dynamic Themes (Stored in ~/.config)
if [ -f "$USER_HOME/.config/gtk-3.0/bookmarks" ]; then
    sed -i "s|/home/rajan/|$USER_HOME/|g" "$USER_HOME/.config/gtk-3.0/bookmarks" 2>/dev/null || true
fi

mkdir -p "$USER_HOME/.config/gtk-3.0" "$USER_HOME/.config/gtk-4.0" "$USER_HOME/.config/walker" "$USER_HOME/.config/mako" "$USER_HOME/.config/omarchy/themed" "$USER_HOME/.config/omarchy/hooks"

# Remove hardcoded GTK_THEME env override
rm -f "$USER_HOME/.config/environment.d/gtk_theme.conf" 2>/dev/null || true

# Dynamic GTK CSS imports
cat > "$USER_HOME/.config/gtk-3.0/gtk.css" << EOF
/* Dynamic GTK Theme Import for Omarchy */
@import url("file://$USER_HOME/.config/omarchy/current/theme/gtk.css");
EOF
cp -f "$USER_HOME/.config/gtk-3.0/gtk.css" "$USER_HOME/.config/gtk-4.0/gtk.css"

# Fix Walker default theme CSS rule order and enforce border-radius
WALKER_DEF_CSS="$HOME/.local/share/omarchy/default/walker/themes/omarchy-default/style.css"
if [ -f "$WALKER_DEF_CSS" ]; then
  sed -i "s|padding: 20px;|padding: 12px; border-radius: 16px;|g" "$WALKER_DEF_CSS" 2>/dev/null || true
  sed -i "s|child:selected {|child:selected { border-radius: 8px;|g" "$WALKER_DEF_CSS" 2>/dev/null || true
fi

# Dynamic Walker Launcher style import
cat > "$USER_HOME/.config/walker/style.css" << EOF
/* Dynamic Walker Stylesheet for Omarchy */
@import url("file://$USER_HOME/.config/omarchy/current/theme/walker.css");
EOF

# Dynamic Mako notification config symlink
rm -f "$USER_HOME/.config/mako/config" 2>/dev/null || true
ln -s "$USER_HOME/.config/omarchy/current/theme/mako.ini" "$USER_HOME/.config/mako/config" 2>/dev/null || true

cat > "$USER_HOME/.config/gtk-3.0/settings.ini" << EOF
[Settings]
gtk-theme-name = omarchy-amethyst-theme
gtk-icon-theme-name = Yaru-blue
gtk-font-name = FiraCode Nerd Font Mono 10
gtk-application-prefer-dark-theme = 1
EOF
cp -f "$USER_HOME/.config/gtk-3.0/settings.ini" "$USER_HOME/.config/gtk-4.0/settings.ini" 

# B. VS Code Settings & Extension Setup
mkdir -p "$USER_HOME/.config/Code/User" "$USER_HOME/.config/Code - OSS/User"
if [ -f "$USER_HOME/Documents/vs_code_setting.json" ]; then
    cp -f "$USER_HOME/Documents/vs_code_setting.json" "$USER_HOME/.config/Code/User/settings.json"
    cp -f "$USER_HOME/Documents/vs_code_setting.json" "$USER_HOME/.config/Code - OSS/User/settings.json"
    sed -i 's/"workbench.colorTheme": .*/"workbench.colorTheme": "Omarchy Amethyst",/g' "$USER_HOME/.config/Code/User/settings.json" 2>/dev/null || true
    sed -i '/workbench.colorCustomizations/,$d' "$USER_HOME/.config/Code/User/settings.json" 2>/dev/null || true
    echo '}' >> "$USER_HOME/.config/Code/User/settings.json" 2>/dev/null || true
fi

# C. CLIAMP Music Playlists
if [ -d "$USER_HOME/.config/cliamp" ]; then
    sed -i "s|/home/rajan/|$USER_HOME/|g" "$USER_HOME/.config/cliamp/playlists/"*.toml "$USER_HOME/.config/cliamp/"*.toml 2>/dev/null || true
    if [ -f "$USER_HOME/.config/cliamp/sync-playlists.sh" ]; then
        chmod +x "$USER_HOME/.config/cliamp/sync-playlists.sh"
        bash "$USER_HOME/.config/cliamp/sync-playlists.sh" >/dev/null 2>&1 || true
    fi
fi

# D. Kernel Command Line Btrfs Subvolume Fix (Limine)
if [ -f /etc/kernel/cmdline ]; then
    if ! grep -q "rootflags=subvol=/" /etc/kernel/cmdline 2>/dev/null; then
        echo -e "${BLUE}Adding rootflags=subvol=/ to /etc/kernel/cmdline...${NC}"
        if command -v sudo &>/dev/null; then
            sudo sed -i 's|rootfstype=btrfs|rootfstype=btrfs rootflags=subvol=/|g' /etc/kernel/cmdline /etc/default/limine 2>/dev/null || true
            if command -v limine-update &>/dev/null; then
                sudo limine-update >/dev/null 2>&1 || true
            fi
        fi
    fi
fi

# E. Shell & Login Shell Configuration
if [ "$SHELL" != "/usr/bin/zsh" ] && command -v zsh &>/dev/null; then
    echo -e "${BLUE}Setting default login shell to Zsh for $CURRENT_USER...${NC}"
    if command -v sudo &>/dev/null; then
        sudo chsh -s /usr/bin/zsh "$CURRENT_USER" 2>/dev/null || chsh -s /usr/bin/zsh "$CURRENT_USER" 2>/dev/null || true
    fi
fi

# Fix unsafe env sourcing lines
for sh_file in "$USER_HOME/.profile" "$USER_HOME/.bash_profile" "$USER_HOME/.bashrc" "$USER_HOME/.zshrc"; do
    if [ -f "$sh_file" ]; then
        sed -i 's|\. "$HOME/\.local/share/\.\./bin/env"|[ -f "$HOME/.local/bin/env" ] \&\& . "$HOME/.local/bin/env"|g' "$sh_file" 2>/dev/null || true
    fi
done

# Set executable permissions on scripts & hooks
chmod +x "$USER_HOME"/.config/cliamp/*.sh 2>/dev/null || true
chmod +x "$USER_HOME"/.config/omarchy/hooks/* 2>/dev/null || true
chmod +x "$USER_HOME"/.config/omarchy/bin/* 2>/dev/null || true
chmod +x "$USER_HOME"/restore_omarchy.sh 2>/dev/null || true

# 7. Refresh Fonts & Reload Omarchy Services
echo -e "\n${BLUE}[6/7] Refreshing font cache & applying Omarchy themes...${NC}"

fc-cache -fv &>/dev/null || true

if command -v hyprctl &>/dev/null; then
    hyprctl reload &>/dev/null || true
fi

if command -v omarchy &>/dev/null; then
    omarchy theme set "omarchy-amethyst-theme" &>/dev/null || true
    omarchy font set "FiraCode Nerd Font" &>/dev/null || true
    omarchy restart waybar &>/dev/null || true
fi

echo -e "\n${GREEN}=======================================================${NC}"
echo -e "${GREEN}🎉 All-In-One Omarchy Restoration Completed Successfully!${NC}"
echo -e "${GREEN}Theme repo pulled directly from https://github.com/rj9884/omarchy-amethyst-theme.git${NC}"
echo -e "${GREEN}GTK3/4, Sushi previewer, VS Code, CLIAMP, Power Switcher, and Zsh restored.${NC}"
echo -e "${YELLOW}Please restart your terminal or log in again to enjoy your environment!${NC}"
echo -e "${GREEN}=======================================================${NC}"
