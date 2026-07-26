<div align="center">

<img src="https://github.com/user-attachments/assets/d990875d-4c4d-4b04-b9c8-011b0804d6d5" alt="Omarchy Amethyst Hero" width="80%" />

# ✨ Omarchy Amethyst ✨

**A beautifully soothing, amethyst-tinted rice for [Omarchy](https://omarchy.org/)**

`omarchy-theme-set amethyst`

<br>

<img src="https://img.shields.io/badge/accent-%23cba6f7-8b5cf6?style=for-the-badge&labelColor=11111b" />
<img src="https://img.shields.io/badge/bg-%2311111b-1e1e2e?style=for-the-badge&labelColor=11111b" />
<img src="https://img.shields.io/badge/fg-%23cdd6f4-cdd6f4?style=for-the-badge&labelColor=11111b" />
<img src="https://img.shields.io/badge/catppuccin-mocha-8b5cf6?style=for-the-badge&labelColor=11111b" />
<img src="https://img.shields.io/badge/font-SF_Pro_%2B_JetBrains_Mono-cdd6f4?style=for-the-badge&labelColor=11111b" />

</div>

---

## 🌟 Features

- **💜 Palette:** Carefully balanced Catppuccin Mocha with a soft Amethyst accent.
- **🖥️ Hyprland:** Deep blur, soft shadows, and elegantly rounded `12px` corners.
- **🧩 Waybar:** Custom circular workspaces and pill-shaped modules.
- **🔒 Lockscreen:** Immersive blurred background with a perfectly centered, custom-sized password field.

---

## 📷 Showcase

### Desktop & Workflow

<p align="center">
  <img alt="preview-01" src="https://github.com/user-attachments/assets/ed6d7123-aba5-49d0-9c4a-ba857a1459ec" width="48%"/>
  <img alt="preview-02" src="https://github.com/user-attachments/assets/a60e583d-c956-4461-883d-b2c71cc843f2" width="48%" />
</p>

### Lockscreen & App Launcher
<p align="center">
 <img alt="lockscreen" src="https://github.com/user-attachments/assets/81417a23-e2e9-410d-a626-aa74f4948118" width="48%" />
 <img alt="preview-02" src="https://github.com/user-attachments/assets/094f0e29-ae9c-4070-a116-569023e3aeac" width="48%" />
</p>

---

## ⚡ Quick Install

```bash
omarchy-theme-install https://github.com/rj9884/omarchy-amethyst-theme.git
```

Or run the automated setup script after cloning:

```bash
git clone https://github.com/rj9884/omarchy-amethyst-theme.git
cd omarchy-amethyst-theme && ./install.sh
```

### 🎨 Prerequisites (Icons & Cursors)

To get the absolute best look, it is highly recommended to install the matching violet folders and mauve cursors.

<details>
<summary><b>Click to view installation commands</b></summary>

```bash
# Papirus Dark — Violet folders
yay -S papirus-icon-theme papirus-folders-git
papirus-folders -C violet --theme Papirus-Dark
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

# Catppuccin Mocha Mauve cursors
yay -S catppuccin-cursors-mocha
gsettings set org.gnome.desktop.interface cursor-theme 'Catppuccin-Mocha-Mauve-Cursors'
```
</details>

---

## 🧩 Waybar Configuration

<p align="center">
  <img width="2880" height="98" alt="waybar" src="https://github.com/user-attachments/assets/8368b82e-ab5c-4168-b1f5-749c5992f52a" />
</p>

### 🌤️ Setting up the Weather Module

1. Click the **weather icon** located on your Waybar.
2. The **Walker** launcher will open automatically—select **Change location**.
3. Type your city and hit enter.
4. Done! The weather will seamlessly update in the background.

---

## 💻 VS Code & Antigravity IDE

### Installing the Amethyst Theme

The repository includes a complete standalone **Omarchy Amethyst** VS Code color theme with comprehensive UI colors and syntax highlighting.

#### Option 1: Manual Installation (Recommended)

1. **Copy the theme file** to your VS Code extensions directory:

   ```bash
   # For VS Code
   mkdir -p ~/.vscode/extensions/omarchy-amethyst-theme-1.0.0/themes
   cp vscode_colors.json ~/.vscode/extensions/omarchy-amethyst-theme-1.0.0/themes/
   
   # For Antigravity IDE
   mkdir -p ~/.config/Antigravity\ IDE/extensions/omarchy-amethyst-theme-1.0.0/themes
   cp vscode_colors.json ~/.config/Antigravity\ IDE/extensions/omarchy-amethyst-theme-1.0.0/themes/
   ```

2. **Create package metadata**:

   ```bash
   # For VS Code
   cat > ~/.vscode/extensions/omarchy-amethyst-theme-1.0.0/package.json << 'EOF'
   {
     "name": "omarchy-amethyst-theme",
     "displayName": "Omarchy Amethyst",
     "description": "Amethyst-tinted VS Code theme from Omarchy",
     "version": "1.0.0",
     "publisher": "omarchy",
     "contributes": {
       "themes": [
         {
           "label": "Omarchy Amethyst",
           "uiTheme": "vs-dark",
           "path": "./themes/vscode_colors.json"
         }
       ]
     }
   }
   EOF
   
   # For Antigravity IDE (same structure)
   cat > ~/.config/Antigravity\ IDE/extensions/omarchy-amethyst-theme-1.0.0/package.json << 'EOF'
   {
     "name": "omarchy-amethyst-theme",
     "displayName": "Omarchy Amethyst",
     "description": "Amethyst-tinted theme from Omarchy",
     "version": "1.0.0",
     "publisher": "omarchy",
     "contributes": {
       "themes": [
         {
           "label": "Omarchy Amethyst",
           "uiTheme": "vs-dark",
           "path": "./themes/vscode_colors.json"
         }
       ]
     }
   }
   EOF
   ```

3. **Activate the theme**:
   - Open VS Code/Antigravity IDE
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on macOS)
   - Type `Preferences: Color Theme`
   - Select **Omarchy Amethyst**

#### Option 2: Symlink (For Development)

If you're actively working on the theme, create a symlink instead:

```bash
# For VS Code
mkdir -p ~/.vscode/extensions/omarchy-amethyst-theme-1.0.0/themes
ln -sf /path/to/repo/vscode_colors.json ~/.vscode/extensions/omarchy-amethyst-theme-1.0.0/themes/vscode_colors.json

# For Antigravity IDE
mkdir -p ~/.config/Antigravity\ IDE/extensions/omarchy-amethyst-theme-1.0.0/themes
ln -sf /path/to/repo/vscode_colors.json ~/.config/Antigravity\ IDE/extensions/omarchy-amethyst-theme-1.0.0/themes/vscode_colors.json
```

### Theme Features

✨ **Complete Coverage**
- 174 workbench colors (buttons, inputs, dropdowns, editor, statusbar, terminal, notifications)
- 27 syntax highlighting scopes (comments, strings, keywords, functions, classes, operators, markup)
- Terminal ANSI color mapping (8 standard + 8 bright colors)
- Selection, cursor, and line highlighting
- Diff colors, merge conflicts, and error/warning decorations

🎨 **Amethyst Palette**
- Accent: `#cba6f7` (primary interactive elements)
- Foreground: `#cdd6f4` (text and UI labels)
- Background: `#11111b` (editor and panels)
- Subtle: `#585b70` (disabled states, secondary text)
- Surface: `#313244` (inputs, dropdowns, selections)

### Testing Checklist

Once installed, verify the theme works correctly:

1. **UI Elements**: Check that buttons, inputs, dropdowns, and status bar use amethyst accent (`#cba6f7`)
2. **Syntax Highlighting**: Open a TypeScript/JavaScript file and verify comments, strings, keywords, and functions are properly colored
3. **Terminal Colors**: Open the terminal and verify ANSI colors render correctly (try `echo -e "\e[31mRed\e[0m \e[32mGreen\e[0m \e[33mYellow\e[0m \e[34mBlue\e[0m"`)
4. **Editor Colors**: Verify line numbers, current line highlight, and selection use the amethyst palette
5. **Activity Bar**: Check that active/inactive icons use proper contrast

---

## 🎨 Color Palette

| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| Base | `#11111b` | <img src="https://placehold.co/12x12/11111b/11111b" /> | Background |
| Text | `#cdd6f4` | <img src="https://placehold.co/12x12/cdd6f4/cdd6f4" /> | Foreground |
| Amethyst | `#cba6f7` | <img src="https://placehold.co/12x12/cba6f7/cba6f7" /> | Accent, borders, active states |
| Surface 0 | `#1e1e2e` | <img src="https://placehold.co/12x12/1e1e2e/1e1e2e" /> | Elevated surfaces |
| Surface 1 | `#313244` | <img src="https://placehold.co/12x12/313244/313244" /> | Selection, dividers |
| Surface 2 | `#585b70` | <img src="https://placehold.co/12x12/585b70/585b70" /> | Subtle overlays |
| Red | `#f38ba8` | <img src="https://placehold.co/12x12/f38ba8/f38ba8" /> | Errors |
| Amethyst | `#cba6f7` | <img src="https://placehold.co/12x12/cba6f7/cba6f7" /> | Success |
| Yellow | `#f9e2af` | <img src="https://placehold.co/12x12/f9e2af/f9e2af" /> | Warnings |

---

## 🖥️ Hyprland Aesthetics

| Setting | Value |
|---------|-------|
| **Active Border** | `#cba6f7` |
| **Inactive Border** | `#313244` |
| **Border Width** | `2px` |
| **Corner Rounding** | `12px` |
| **Gaps (In / Out)** | `4px` / `8px` |
| **Blur Settings** | size `6`, passes `3`, contrast `1.0`, brightness `1.1`, vibrancy `0.16`, noise `0.02` |
| **Shadows** | range `20`, render power `3`, `rgba(00000066)` |
| **Animations** | `fluent_decel`, `easeOutCirc`, `easeOutCubic`, `easeInOutSine`, `overshot` |

---

## 🖼️ Wallpaper Collection

<p align="center">
<img alt="desolate-city" src="https://github.com/user-attachments/assets/2fff97be-4a7e-4fee-aaf4-d0e8eb26b0ab" width="24%" />
<img alt="dark-ruins-anime-girl" src="https://github.com/user-attachments/assets/7e5e93b8-6f3f-4be4-816e-9499edffd349" width="24%" />
<img alt="dark-forest-silhouette" src="https://github.com/user-attachments/assets/d464a282-3c09-4457-9ef8-24f213d682e7" width="24%" />
<img alt="anime-lake-cottage-sunset" src="https://github.com/user-attachments/assets/1a79f3cd-8fe9-4d17-955d-dd2496cf85a5" width="24%" />
</p>
<p align="center">
<img alt="moody-lit-cabin" src="https://github.com/user-attachments/assets/c3729a67-014f-4415-a4d7-d604b2347eaf" width="24%" />
<img alt="minimalist-great-wave" src="https://github.com/user-attachments/assets/c19bbfe0-c383-428d-9605-e0dbdeb88c1a" width="24%" />
<img alt="geisha-skull-art" src="https://github.com/user-attachments/assets/12fb5bdb-b257-4d3b-8a7e-27524ca4e73e" width="24%" />
<img alt="desolate-city-2" src="https://github.com/user-attachments/assets/a004ba47-510f-4d2f-aa02-a0b74c704b97" width="24%" />
</p>
<p align="center">
<img alt="starry-river-powerlines" src="https://github.com/user-attachments/assets/bebfc08b-9a66-479f-bd2d-9dca301ad6b9" width="24%" />
<img alt="railroad-2" src="https://github.com/user-attachments/assets/8d7a9486-f7df-418c-b936-b8818b4d4c7e" width="24%" />
<img alt="plane-purple" src="https://github.com/user-attachments/assets/be4275d0-32d0-4511-bea5-f57243adc28c" width="24%" />
<img alt="pixel-reading" src="https://github.com/user-attachments/assets/c5eb8fb3-e502-489f-ad9a-6fa4bac2e0af" width="24%" />
</p>
<p align="center">
<img alt="upside-down-neon-city" src="https://github.com/user-attachments/assets/3a8dd058-3f7b-4361-b238-51276691d13e" width="24%" />
<img alt="twilight-anime-girl" src="https://github.com/user-attachments/assets/2ef09e5c-e14e-4cce-9dd7-e60140993c33" width="24%" />
<img alt="train-sideview" src="https://github.com/user-attachments/assets/24ae6f18-cf57-478c-8d4a-eef56beeed54" width="24%"  />
<img alt="stylized-cherry-blossoms" src="https://github.com/user-attachments/assets/f507914f-ede7-4e3e-a4ad-addbc64446c1" width="24%"  />
<img alt="vibrant-gate" src="https://github.com/user-attachments/assets/fee914b1-22b1-4741-a14a-6439cebfb2c0" width="24%" />
</p>

---

## 🤝 Contributing

Pull requests are always welcome! If you have a major change or feature request, please open an issue first to discuss it.

1. 🍴 Fork the repository
2. 🌿 Create your feature branch (`git checkout -b feat/beautiful-addition`)
3. 💾 Commit your changes (`git commit -m 'feat: added beautiful addition'`)
4. 🚀 Push to the branch (`git push origin feat/beautiful-addition`)
5. 🔄 Open a Pull Request

<br>

<div align="center">
  <sub>Made with 💜 for the Omarchy community</sub>
</div>
