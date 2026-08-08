#!/usr/bin/env bash
set -e

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_NAME="omarchy-amethyst-theme"
USER_THEME_DEST="$HOME/.config/omarchy/themes/$THEME_NAME"

echo "=== Installing Omarchy Amethyst Theme ==="

# 1. Install fonts if needed
mkdir -p "$HOME/.local/share/fonts/FiraCode"
if ! fc-list :family | grep -iq "FiraCode"; then
  echo "Downloading FiraCode Nerd Font..."
  curl -sfLo /tmp/FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
  unzip -qo /tmp/FiraCode.zip -d "$HOME/.local/share/fonts/FiraCode/"
  fc-cache -fv &>/dev/null || true
fi

# 2. Copy theme into ~/.config/omarchy/themes/
mkdir -p "$USER_THEME_DEST"
cp -rf "$THEME_DIR/"* "$USER_THEME_DEST/"

# 3. Configure Dynamic User Overrides in ~/.config/ (Never in ~/.local/share/omarchy)
mkdir -p "$HOME/.config/gtk-3.0" "$HOME/.config/gtk-4.0" "$HOME/.config/walker" "$HOME/.config/mako" "$HOME/.config/omarchy/themed" "$HOME/.config/omarchy/hooks"

# Dynamic GTK CSS imports
cat > "$HOME/.config/gtk-3.0/gtk.css" << EOF
/* Dynamic GTK Theme Import for Omarchy */
@import url("file://$HOME/.config/omarchy/current/theme/gtk.css");
EOF
cp -f "$HOME/.config/gtk-3.0/gtk.css" "$HOME/.config/gtk-4.0/gtk.css"

# Fix Walker default theme CSS rule order and enforce border-radius
WALKER_DEF_CSS="$HOME/.local/share/omarchy/default/walker/themes/omarchy-default/style.css"
if [ -f "$WALKER_DEF_CSS" ]; then
  sed -i "s|padding: 20px;|padding: 12px; border-radius: 16px;|g" "$WALKER_DEF_CSS" 2>/dev/null || true
  sed -i "s|child:selected {|child:selected { border-radius: 8px;|g" "$WALKER_DEF_CSS" 2>/dev/null || true
fi

# Dynamic Walker Launcher style import
cat > "$HOME/.config/walker/style.css" << EOF
/* Dynamic Walker Stylesheet for Omarchy */
@import url("file://$HOME/.config/omarchy/current/theme/walker.css");
EOF

# Dynamic Mako notification config symlink
rm -f "$HOME/.config/mako/config" 2>/dev/null || true
ln -s "$HOME/.config/omarchy/current/theme/mako.ini" "$HOME/.config/mako/config" 2>/dev/null || true

# GTK settings
cat > "$HOME/.config/gtk-3.0/settings.ini" << EOF
[Settings]
gtk-theme-name = omarchy-amethyst-theme
gtk-icon-theme-name = Yaru-blue
gtk-font-name = FiraCode Nerd Font 10
gtk-application-prefer-dark-theme = 1
EOF
cp -f "$HOME/.config/gtk-3.0/settings.ini" "$HOME/.config/gtk-4.0/settings.ini"

# Configure lock shortcut override if needed
HYPR_BINDINGS="$HOME/.config/hypr/bindings.conf"
if [ -f "$HYPR_BINDINGS" ] && ! grep -q "OMARCHY_LOCK_ONLY=true omarchy-system-lock" "$HYPR_BINDINGS"; then
  echo "" >> "$HYPR_BINDINGS"
  echo "# Screen Locking" >> "$HYPR_BINDINGS"
  echo "unbind = SUPER CTRL, L" >> "$HYPR_BINDINGS"
  echo "bindd = SUPER CTRL, L, Lock system, exec, OMARCHY_LOCK_ONLY=true omarchy-system-lock" >> "$HYPR_BINDINGS"
fi

# 4. Deploy User Templates to ~/.config/omarchy/themed/
if [ -d "$THEME_DIR/themed" ]; then
  cp -rf "$THEME_DIR/themed/"* "$HOME/.config/omarchy/themed/" 2>/dev/null || true
fi

# Remove any hardcoded GTK_THEME env overrides
rm -f "$HOME/.config/environment.d/gtk_theme.conf" 2>/dev/null || true

# GNOME settings if gsettings available
if command -v gsettings &>/dev/null; then
  gsettings set org.gnome.desktop.interface color-scheme "prefer-dark" 2>/dev/null || true
  gsettings set org.gnome.TextEditor style-scheme "builder-dark" 2>/dev/null || true
fi

# 5. Apply via Omarchy CLI if present
if command -v omarchy &>/dev/null; then
  omarchy theme set "$THEME_NAME"
fi

echo "✓ Omarchy Amethyst Theme successfully installed and configured dynamically in ~/.config!"

# Terminate cached processes to reload CSS immediately
nautilus -q 2>/dev/null || true
pkill -f nautilus 2>/dev/null || true
makoctl reload 2>/dev/null || true
pkill -f xdg-desktop-portal-gtk 2>/dev/null || true
pkill -f xdg-desktop-portal 2>/dev/null || true
