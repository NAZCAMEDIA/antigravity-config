#!/bin/bash
# 🔄 Antigravity Configuration Backup Script
# Drake Corsair Edition

set -e

# Colors
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${ORANGE}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║       🔄 ANTIGRAVITY CONFIG BACKUP - CORSAIR EDITION     ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    ANTIGRAVITY_USER_DIR="$HOME/Library/Application Support/Antigravity/User"
    ANTIGRAVITY_EXT_DIR="$HOME/.antigravity/extensions"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ANTIGRAVITY_USER_DIR="$HOME/.config/Antigravity/User"
    ANTIGRAVITY_EXT_DIR="$HOME/.antigravity/extensions"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

echo -e "${CYAN}📂 Backing up to: $REPO_DIR${NC}"
echo ""

# Backup settings.json
echo -e "${ORANGE}⚙️  Backing up settings.json...${NC}"
if [ -f "$ANTIGRAVITY_USER_DIR/settings.json" ]; then
    cp "$ANTIGRAVITY_USER_DIR/settings.json" "$REPO_DIR/settings/"
    echo -e "${GREEN}   ✓ Settings backed up${NC}"
else
    echo -e "${CYAN}   ⚠ settings.json not found${NC}"
fi

# Backup custom modes
echo -e "${ORANGE}🤖 Backing up Kilo Code custom modes...${NC}"
MODES_FILE="$ANTIGRAVITY_USER_DIR/globalStorage/kilocode.kilo-code/settings/custom_modes.yaml"
if [ -f "$MODES_FILE" ]; then
    cp "$MODES_FILE" "$REPO_DIR/kilo-code/"
    echo -e "${GREEN}   ✓ Custom modes backed up${NC}"
else
    echo -e "${CYAN}   ⚠ custom_modes.yaml not found${NC}"
fi

# Backup CorsairHUD+ Theme
echo -e "${ORANGE}🎨 Backing up CorsairHUD+ Theme...${NC}"
THEME_SRC="$ANTIGRAVITY_EXT_DIR/drake-corsair.corsairhud-plus-theme-1.0.0"
if [ -d "$THEME_SRC" ]; then
    mkdir -p "$REPO_DIR/themes/corsairhud-plus/themes"
    cp -r "$THEME_SRC/"* "$REPO_DIR/themes/corsairhud-plus/"
    echo -e "${GREEN}   ✓ Theme backed up${NC}"
else
    echo -e "${CYAN}   ⚠ CorsairHUD+ theme not found${NC}"
fi

# Generate extensions list
echo -e "${ORANGE}🔌 Generating extensions list...${NC}"
if [ -d "$ANTIGRAVITY_EXT_DIR" ]; then
    > "$REPO_DIR/extensions/extensions.txt"
    echo "# Antigravity Extensions List" >> "$REPO_DIR/extensions/extensions.txt"
    echo "# Generated on $(date)" >> "$REPO_DIR/extensions/extensions.txt"
    echo "# Install all with: cat extensions.txt | xargs -L 1 antigravity --install-extension" >> "$REPO_DIR/extensions/extensions.txt"
    echo "" >> "$REPO_DIR/extensions/extensions.txt"
    
    for ext_dir in "$ANTIGRAVITY_EXT_DIR"/*/; do
        if [ -f "$ext_dir/package.json" ]; then
            ext_name=$(basename "$ext_dir" | sed 's/-[0-9].*$//' | sed 's/-darwin-arm64$//' | sed 's/-universal$//')
            # Skip our custom theme
            if [[ "$ext_name" != "drake-corsair.corsairhud-plus-theme" ]]; then
                echo "$ext_name" >> "$REPO_DIR/extensions/extensions.txt"
            fi
        fi
    done
    echo -e "${GREEN}   ✓ Extensions list generated${NC}"
fi

echo ""
echo -e "${ORANGE}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║                 ✅ BACKUP COMPLETE!                      ║"
echo "║                                                          ║"
echo "║     Don't forget to commit and push your changes:        ║"
echo "║     git add -A && git commit -m 'Update config'          ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"
