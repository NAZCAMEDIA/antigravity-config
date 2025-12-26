#!/bin/bash
# 🚀 Antigravity Configuration Installer
# Drake Corsair Edition

set -e

# Colors for output
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${ORANGE}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║     🚀 ANTIGRAVITY CONFIG INSTALLER - CORSAIR EDITION    ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    ANTIGRAVITY_USER_DIR="$HOME/Library/Application Support/Antigravity/User"
    ANTIGRAVITY_EXT_DIR="$HOME/.antigravity/extensions"
    ANTIGRAVITY_CMD="antigravity"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ANTIGRAVITY_USER_DIR="$HOME/.config/Antigravity/User"
    ANTIGRAVITY_EXT_DIR="$HOME/.antigravity/extensions"
    ANTIGRAVITY_CMD="antigravity"
else
    echo -e "${RED}❌ Unsupported OS: $OSTYPE${NC}"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

echo -e "${CYAN}📂 Repository: $REPO_DIR${NC}"
echo -e "${CYAN}📂 Antigravity User Dir: $ANTIGRAVITY_USER_DIR${NC}"
echo ""

# Create directories if needed
mkdir -p "$ANTIGRAVITY_USER_DIR"
mkdir -p "$ANTIGRAVITY_EXT_DIR"
mkdir -p "$ANTIGRAVITY_USER_DIR/globalStorage/kilocode.kilo-code/settings"

# Install settings.json
echo -e "${ORANGE}⚙️  Installing settings.json...${NC}"
if [ -f "$REPO_DIR/settings/settings.json" ]; then
    cp "$REPO_DIR/settings/settings.json" "$ANTIGRAVITY_USER_DIR/settings.json"
    echo -e "${GREEN}   ✓ Settings installed${NC}"
else
    echo -e "${RED}   ✗ settings.json not found${NC}"
fi

# Install custom modes
echo -e "${ORANGE}🤖 Installing Kilo Code custom modes...${NC}"
if [ -f "$REPO_DIR/kilo-code/custom_modes.yaml" ]; then
    cp "$REPO_DIR/kilo-code/custom_modes.yaml" "$ANTIGRAVITY_USER_DIR/globalStorage/kilocode.kilo-code/settings/"
    echo -e "${GREEN}   ✓ Custom modes installed${NC}"
else
    echo -e "${RED}   ✗ custom_modes.yaml not found${NC}"
fi

# Install CorsairHUD+ Theme
echo -e "${ORANGE}🎨 Installing CorsairHUD+ Theme...${NC}"
THEME_DEST="$ANTIGRAVITY_EXT_DIR/drake-corsair.corsairhud-plus-theme-1.0.0"
if [ -d "$REPO_DIR/themes/corsairhud-plus" ]; then
    rm -rf "$THEME_DEST"
    mkdir -p "$THEME_DEST"
    cp -r "$REPO_DIR/themes/corsairhud-plus/"* "$THEME_DEST/"
    echo -e "${GREEN}   ✓ CorsairHUD+ theme installed${NC}"
else
    echo -e "${RED}   ✗ Theme folder not found${NC}"
fi

# Install extensions
echo -e "${ORANGE}🔌 Installing extensions...${NC}"
if [ -f "$REPO_DIR/extensions/extensions.txt" ]; then
    while IFS= read -r line || [[ -n "$line" ]]; do
        # Skip empty lines and comments
        [[ -z "$line" || "$line" =~ ^# ]] && continue
        
        echo -e "   Installing: ${CYAN}$line${NC}"
        $ANTIGRAVITY_CMD --install-extension "$line" --force 2>/dev/null || echo -e "   ${RED}Failed to install $line${NC}"
    done < "$REPO_DIR/extensions/extensions.txt"
    echo -e "${GREEN}   ✓ Extensions installation complete${NC}"
else
    echo -e "${RED}   ✗ extensions.txt not found${NC}"
fi

echo ""
echo -e "${ORANGE}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║              ✅ INSTALLATION COMPLETE!                   ║"
echo "║                                                          ║"
echo "║     Restart Antigravity to apply all changes             ║"
echo "║     Theme: CorsairHUD+ should be auto-selected           ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"
