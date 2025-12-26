# 🚀 Antigravity Configuration Sync

> **Drake Corsair Edition** - Complete Antigravity/VS Code configuration backup and sync solution

![Theme](https://img.shields.io/badge/Theme-CorsairHUD+-FF9F00?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-macOS-000000?style=for-the-badge&logo=apple)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

## 📦 What's Included

- 🎨 **CorsairHUD+ Theme** - Custom Drake Corsair inspired dark theme with orange HUD colors
- ⚙️ **User Settings** - Complete `settings.json` configuration
- 🔌 **Extensions List** - All installed extensions with auto-install script
- 🤖 **Kilo Code Modes** - Custom AI assistant modes (Code Reviewer, Docs Specialist, etc.)
- 📜 **Scripts** - Backup and restore automation

## 🛠️ Quick Install

### One-Line Install (macOS)

```bash
curl -fsSL https://raw.githubusercontent.com/NAZCAMEDIA/antigravity-config/main/scripts/install.sh | bash
```

### Manual Install

```bash
# Clone repository
git clone https://github.com/NAZCAMEDIA/antigravity-config.git
cd antigravity-config

# Run install script
./scripts/install.sh
```

## 📁 Repository Structure

```
antigravity-config/
├── README.md
├── themes/
│   └── corsairhud-plus/          # CorsairHUD+ Theme Extension
│       ├── corsairhud-plus-theme-1.0.0.vsix  # Pre-built extension package
│       ├── package.json
│       └── themes/
│           └── corsairhud-plus.json
├── settings/
│   └── settings.json             # User settings
├── kilo-code/
│   └── custom_modes.yaml         # Custom AI modes
├── extensions/
│   └── extensions.txt            # List of extensions to install
└── scripts/
    ├── install.sh                # Full installation script
    ├── backup.sh                 # Backup current config
    └── install-extensions.sh     # Install extensions only
```

## 🎨 CorsairHUD+ Theme

A dark theme inspired by the Drake Corsair cockpit HUD from Star Citizen:

| Element | Color |
|---------|-------|
| Primary | `#FF9F00` (Orange) |
| Background | `#0A0A0B` (Near Black) |
| Strings | `#73C43A` (Green) |
| Functions | `#33D4FF` (Cyan) |
| Keywords | `#FF6B00` (Deep Orange) |
| Classes | `#FFED4E` (Yellow) |

## 🔌 Included Extensions

| Extension | Publisher | Description |
|-----------|-----------|-------------|
| Claude Code | Anthropic | AI coding assistant |
| Antigravity Panel | N2N Studio | Antigravity integration |
| Antigravity Cockpit | jlcodes | Model management cockpit |
| Kilo Code | kilocode | AI code assistant modes |
| GitHub Actions | GitHub | GitHub Actions workflow support |
| SQLite Viewer | Florian Klampfer | View SQLite databases |
| CodeRabbit | CodeRabbit | AI code reviews |
| Markdown Lint | DavidAnson | Markdown linting |
| ChatGPT | OpenAI | OpenAI integration |
| Gemini CLI | Google | Google Gemini integration |
| PHP Tools | DEVSENSE | PHP development suite |
| Python | Microsoft | Python language support |
| Java Pack | Microsoft | Java development tools |
| Go | Golang | Go language support |
| Ruby LSP | Shopify | Ruby language server |
| Docker | Microsoft | Container tools |

## ⚙️ Configuration Highlights

### Editor Settings

- **Font**: JetBrains Mono
- **Theme**: CorsairHUD+

### Kilo Code Custom Modes

- **Code Reviewer** - Senior engineer code review perspective
- **Documentation Specialist** - Technical writing expert
- **Frontend Specialist** - React/TypeScript/CSS expert
- **Test Engineer** - QA and testing focus

## 🎨 Rebuilding the Theme

If you modify the theme files and need to rebuild the .vsix package:

```bash
cd themes/corsairhud-plus
npm install -g @vscode/vsce  # Install packaging tool if not present
vsce package --allow-missing-repository
```

This will create/update `corsairhud-plus-theme-1.0.0.vsix` which can then be installed.

## 🔄 Backup Your Config

To backup your current configuration:

```bash
./scripts/backup.sh
```

This will update all files in this repository with your current settings.

## 📝 License

MIT License - Feel free to use and modify!

---

*Made with 🧡 for the Drake Corsair community*
