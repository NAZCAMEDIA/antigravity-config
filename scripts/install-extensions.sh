#!/bin/bash
# 🔌 Antigravity Extensions Installer (Extensions Only)
# Drake Corsair Edition

set -e

ORANGE='\033[0;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${ORANGE}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║          🔌 ANTIGRAVITY EXTENSIONS INSTALLER             ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
EXTENSIONS_FILE="$REPO_DIR/extensions/extensions.txt"

if [ ! -f "$EXTENSIONS_FILE" ]; then
    echo -e "${RED}❌ extensions.txt not found at $EXTENSIONS_FILE${NC}"
    exit 1
fi

# Detect command
ANTIGRAVITY_CMD="antigravity"
if ! command -v $ANTIGRAVITY_CMD &> /dev/null; then
    # Try code as fallback
    if command -v code &> /dev/null; then
        ANTIGRAVITY_CMD="code"
        echo -e "${CYAN}ℹ Using 'code' command instead of 'antigravity'${NC}"
    else
        echo -e "${RED}❌ Neither 'antigravity' nor 'code' command found${NC}"
        exit 1
    fi
fi

echo -e "${CYAN}📂 Extensions file: $EXTENSIONS_FILE${NC}"
echo ""

total=0
success=0
failed=0

while IFS= read -r line || [[ -n "$line" ]]; do
    # Skip empty lines and comments
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    
    ((total++))
    echo -e "Installing: ${CYAN}$line${NC}"
    
    if $ANTIGRAVITY_CMD --install-extension "$line" --force 2>/dev/null; then
        echo -e "   ${GREEN}✓ Success${NC}"
        ((success++))
    else
        echo -e "   ${RED}✗ Failed${NC}"
        ((failed++))
    fi
done < "$EXTENSIONS_FILE"

echo ""
echo -e "${ORANGE}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║                   📊 SUMMARY                             ║"
echo "║                                                          ║"
printf "║     Total: %-5s  Success: %-5s  Failed: %-5s       ║\n" "$total" "$success" "$failed"
echo "║                                                          ║"
echo "║     Restart Antigravity to load new extensions           ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"
