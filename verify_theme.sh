#!/bin/bash
# Amethyst Theme Installation Verification Script
# Checks theme file integrity and installation status

set -e

REPO_DIR="/home/rajan/omarchy-amethyst-theme"
THEME_FILE="$REPO_DIR/vscode_colors.json"
VSCODE_EXT_DIR="$HOME/.vscode/extensions/amethyst-theme"
ANTIGRAVITY_EXT_DIR="$HOME/.config/Antigravity\ IDE/extensions/amethyst-theme"

echo "=== Amethyst Theme Verification ==="
echo

# 1. Check theme file exists and is valid JSON
echo "✓ Checking theme file..."
if [ ! -f "$THEME_FILE" ]; then
    echo "✗ Theme file not found: $THEME_FILE"
    exit 1
fi

if ! jq empty "$THEME_FILE" 2>/dev/null; then
    echo "✗ Theme file has invalid JSON"
    exit 1
fi

THEME_SIZE=$(wc -c < "$THEME_FILE")
THEME_LINES=$(wc -l < "$THEME_FILE")
echo "  File: $THEME_FILE"
echo "  Size: $THEME_SIZE bytes ($THEME_LINES lines)"
echo

# 2. Verify theme structure
echo "✓ Checking theme structure..."
COLORS_COUNT=$(jq '.colors | length' "$THEME_FILE")
TOKEN_COLORS_COUNT=$(jq '.tokenColors | length' "$THEME_FILE")
TERMINAL_COLORS_COUNT=$(jq '.terminalColors | length' "$THEME_FILE")

echo "  Workbench colors: $COLORS_COUNT"
echo "  TokenColor scopes: $TOKEN_COLORS_COUNT"
echo "  Terminal ANSI colors: $TERMINAL_COLORS_COUNT"
echo

# 3. Check VS Code installation
echo "✓ Checking VS Code installation..."
if [ -d "$VSCODE_EXT_DIR" ]; then
    if [ -f "$VSCODE_EXT_DIR/package.json" ] && [ -f "$VSCODE_EXT_DIR/colors.json" ]; then
        echo "  ✓ Theme installed at: $VSCODE_EXT_DIR"
        echo "  Status: Ready for VS Code"
    else
        echo "  ✗ Extension directory exists but missing required files"
    fi
else
    echo "  ✗ Theme not installed for VS Code"
    echo "  Install with: mkdir -p '$VSCODE_EXT_DIR' && cp -r $REPO_DIR/* '$VSCODE_EXT_DIR'"
fi
echo

# 4. Check Antigravity IDE installation
echo "✓ Checking Antigravity IDE installation..."
if [ -d "$ANTIGRAVITY_EXT_DIR" ]; then
    echo "  ✓ Theme installed at: $ANTIGRAVITY_EXT_DIR"
    echo "  Status: Ready for Antigravity IDE"
else
    echo "  ✗ Theme not installed for Antigravity IDE"
    echo "  Install with: mkdir -p '$ANTIGRAVITY_EXT_DIR' && cp -r $REPO_DIR/* '$ANTIGRAVITY_EXT_DIR'"
fi
echo

# 5. Check for duplicate tokenColor scopes
echo "✓ Checking for duplicate scopes..."
UNIQUE_SCOPES=$(jq -r '.tokenColors[].scope // .tokenColors[].scopes[]?' "$THEME_FILE" 2>/dev/null | sort | uniq | wc -l)
TOTAL_SCOPES=$(jq '.tokenColors | length' "$THEME_FILE")
echo "  Total tokenColor entries: $TOTAL_SCOPES"
echo "  Unique scopes: $UNIQUE_SCOPES"
if [ "$UNIQUE_SCOPES" -eq "$TOTAL_SCOPES" ]; then
    echo "  ✓ No duplicate scopes detected"
else
    echo "  ⚠ Warning: Some scopes may be defined multiple times"
fi
echo

# 6. Validate hex colors
echo "✓ Validating hex colors..."
INVALID_COLORS=$(jq -r '
  (.colors | to_entries[] | "\(.value)") +
  (.terminalColors | to_entries[] | "\(.value)") +
  (.tokenColors[].settings | [.foreground, .background, .fontStyle] | .[]?)
' "$THEME_FILE" 2>/dev/null | grep -v '^null$' | grep -v '^$' | grep -vE '^#[0-9a-fA-F]{6}([0-9a-fA-F]{2})?$' | wc -l)

if [ "$INVALID_COLORS" -eq 0 ]; then
    echo "  ✓ All colors use valid hex format"
else
    echo "  ✗ Found $INVALID_COLORS invalid color values"
fi
echo

# 7. Summary
echo "=== Verification Complete ==="
echo "Theme is ready for testing in VS Code and Antigravity IDE"
echo
echo "Next steps:"
echo "1. Open VS Code"
echo "2. Go to File > Preferences > Color Theme"
echo "3. Select 'Omarchy Amethyst'"
echo "4. Test syntax highlighting with various file types"
echo "5. Check UI elements (buttons, tabs, statusbar, etc.)"
echo "6. Test terminal colors (View > Terminal)"
