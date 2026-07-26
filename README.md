# Omarchy Amethyst Theme 💎

A premium, dark Catppuccin Mocha / Amethyst design system for **Omarchy Linux / Hyprland**, featuring deep violet-black background colors (`#11111b`), vibrant accents (`#cba6f7`), and automated configuration for GTK 3/4 applications, Waybar, GNOME Text Editor, GNOME Sushi, Walker, Wofi, Cava, and VS Code.

---

## 🎨 Theme Highlights
- **System-Wide Harmony**: Tailored dark theme matching Waybar, Hyprland, Walker, Wofi, Cava, and VS Code.
- **GTK 3 & GTK 4 / Libadwaita**: Custom CSS overrides for GTK popovers, context menus, dialogs, CSD headerbars, and file properties.
- **GNOME Apps Integration**: Automated GtkSourceView 4 & 5 color schemes (`amethyst.xml`, `builder-dark.style-scheme.xml`) for GNOME Text Editor and GNOME Sushi (Space bar file previewer).
- **Auto-Sync Hook**: Included Omarchy `theme-set` hook ensures all application configs and VS Code color customizations update dynamically whenever you switch themes.

---

## 🚀 One-Command Installation

To install or update the theme on any Omarchy desktop:

```bash
git clone https://github.com/rj9884/omarchy-amethyst-theme.git
cd omarchy-amethyst-theme
./install.sh
```

Or apply via Omarchy CLI:

```bash
omarchy theme set "omarchy-amethyst-theme"
```

---

## 📁 Repository Structure
- `install.sh`: One-click installer & configuration setup script.
- `gtk-3.0/gtk.css`: Pure GTK3-compliant CSS for headerbars, menus, and GTK3 applications.
- `gtk-4.0/gtk.css`: Libadwaita / GTK4 CSS for popovers, context menus, and dark dialogs.
- `gtksourceview/`: Custom GtkSourceView XML style schemes (`amethyst.xml`, `builder-dark.style-scheme.xml`).
- `waybar/`: Clean Waybar layout configuration (`config.jsonc` & `style.css`).
- `vscode_colors.json`: Catppuccin Mocha workbench color customizations for VS Code.
- `walker.css`, `wofi.css`, `cava_theme`, `ghostty.conf`, `btop.theme`, `alacritty.toml`, `kitty.conf`: App themes.

---

## 📄 License
MIT © Rajan
