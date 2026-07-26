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

# 3. Setup GTK 3 & GTK 4 styles
mkdir -p "$HOME/.config/gtk-3.0" "$HOME/.config/gtk-4.0"
if [ -f "$THEME_DIR/gtk-3.0/gtk.css" ]; then
  cp -f "$THEME_DIR/gtk-3.0/gtk.css" "$HOME/.config/gtk-3.0/gtk.css"
else
  cp -f "$THEME_DIR/gtk.css" "$HOME/.config/gtk-3.0/gtk.css"
fi

if [ -f "$THEME_DIR/gtk-4.0/gtk.css" ]; then
  cp -f "$THEME_DIR/gtk-4.0/gtk.css" "$HOME/.config/gtk-4.0/gtk.css"
else
  cp -f "$THEME_DIR/gtk.css" "$HOME/.config/gtk-4.0/gtk.css"
fi

# GTK3 dark settings
cat > "$HOME/.config/gtk-3.0/settings.ini" << 'EOF'
[Settings]
gtk-theme-name = Adwaita-dark
gtk-icon-theme-name = Yaru-blue
gtk-font-name = FiraCode Nerd Font 10
gtk-application-prefer-dark-theme = 1
EOF

# 4. GtkSourceView schemes (for GNOME Text Editor & Sushi)
mkdir -p "$HOME/.local/share/gtksourceview-4/styles"
mkdir -p "$HOME/.local/share/gtksourceview-5/styles"
mkdir -p "$HOME/.local/share/sushi/gtksourceview-4/styles"
mkdir -p "$HOME/.local/share/sushi/styles"

if [ -f "$THEME_DIR/gtksourceview/amethyst.xml" ]; then
  cp -f "$THEME_DIR/gtksourceview/amethyst.xml" "$HOME/.local/share/gtksourceview-4/styles/"
  cp -f "$THEME_DIR/gtksourceview/amethyst.xml" "$HOME/.local/share/gtksourceview-5/styles/"
fi

if [ -f "$THEME_DIR/gtksourceview/builder-dark.style-scheme.xml" ]; then
  cp -f "$THEME_DIR/gtksourceview/builder-dark.style-scheme.xml" "$HOME/.local/share/gtksourceview-4/styles/"
  cp -f "$THEME_DIR/gtksourceview/builder-dark.style-scheme.xml" "$HOME/.local/share/gtksourceview-5/styles/"
  cp -f "$THEME_DIR/gtksourceview/builder-dark.style-scheme.xml" "$HOME/.local/share/sushi/gtksourceview-4/styles/"
  cp -f "$THEME_DIR/gtksourceview/builder-dark.style-scheme.xml" "$HOME/.local/share/sushi/styles/"
fi

# System-wide sushi update if non-interactive sudo access exists
if command -v sudo &>/dev/null && sudo -n true 2>/dev/null && [ -f /usr/share/sushi/gtksourceview-4/styles/builder-dark.style-scheme.xml ]; then
  sudo -n sed -i 's|value="#1e1e1e"|value="#11111b"|g' /usr/share/sushi/gtksourceview-4/styles/builder-dark.style-scheme.xml 2>/dev/null || true
  sudo -n sed -i 's|value="#303030"|value="#181825"|g' /usr/share/sushi/gtksourceview-4/styles/builder-dark.style-scheme.xml 2>/dev/null || true
fi

# GNOME settings if gsettings available
if command -v gsettings &>/dev/null; then
  gsettings set org.gnome.desktop.interface color-scheme "prefer-dark" 2>/dev/null || true
  gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark" 2>/dev/null || true
  gsettings set org.gnome.TextEditor style-scheme "amethyst" 2>/dev/null || true
fi

# 5. Application configs (Walker, Wofi, Cava)
mkdir -p "$HOME/.config/walker" "$HOME/.config/wofi" "$HOME/.config/cava"
[ -f "$THEME_DIR/walker.css" ] && cp -f "$THEME_DIR/walker.css" "$HOME/.config/walker/style.css"
[ -f "$THEME_DIR/wofi.css" ] && cp -f "$THEME_DIR/wofi.css" "$HOME/.config/wofi/style.css"
[ -f "$THEME_DIR/cava_theme" ] && cp -f "$THEME_DIR/cava_theme" "$HOME/.config/cava/config"

# 6. Apply via Omarchy CLI if present
if command -v omarchy &>/dev/null; then
  omarchy theme set "$THEME_NAME"
fi

echo "✓ Omarchy Amethyst Theme successfully installed and configured!"
