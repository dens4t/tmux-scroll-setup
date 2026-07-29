#!/bin/bash

# Tmux Scroll Setup - Installation Script
# https://github.com/YOUR_USERNAME/tmux-scroll-setup

set -e

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         Tmux Scroll Setup - Installation Script             ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "❌ Tmux not found. Installing tmux..."
    
    # Detect OS and install
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt-get &> /dev/null; then
            sudo apt-get update && sudo apt-get install -y tmux
        elif command -v yum &> /dev/null; then
            sudo yum install -y tmux
        elif command -v pacman &> /dev/null; then
            sudo pacman -S tmux
        else
            echo "❌ Cannot detect package manager. Please install tmux manually."
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew &> /dev/null; then
            brew install tmux
        else
            echo "❌ Homebrew not found. Please install tmux manually."
            exit 1
        fi
    fi
fi

echo "✅ Tmux version: $(tmux -V)"
echo

# Backup existing config
if [ -f ~/.tmux.conf ]; then
    BACKUP_FILE=~/.tmux.conf.backup.$(date +%Y%m%d_%H%M%S)
    echo "📦 Backing up existing config to: $BACKUP_FILE"
    cp ~/.tmux.conf "$BACKUP_FILE"
fi

# Download or copy config
if [ -f ".tmux.conf" ]; then
    echo "📝 Installing .tmux.conf..."
    cp .tmux.conf ~/.tmux.conf
else
    echo "📥 Downloading .tmux.conf from GitHub..."
    curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/tmux-scroll-setup/main/.tmux.conf -o ~/.tmux.conf
fi

echo "✅ Config installed to: ~/.tmux.conf"
echo

# Add aliases to bashrc if not already present
if ! grep -q "# Tmux Aliases" ~/.bashrc 2>/dev/null; then
    echo "📝 Adding bash aliases..."
    cat >> ~/.bashrc << 'EOF'

# ==========================
# Tmux Aliases
# ==========================
alias tm='tmux'
alias tma='tmux attach -t'
alias tmn='tmux new -s'
alias tml='tmux ls'
alias tmk='tmux kill-session -t'
alias tmr='tmux source-file ~/.tmux.conf && echo "✅ Tmux config reloaded"'
EOF
    echo "✅ Aliases added to ~/.bashrc"
else
    echo "ℹ️  Aliases already exist in ~/.bashrc"
fi

echo

# Reload config if tmux is running
if tmux info &> /dev/null 2>&1; then
    echo "🔄 Reloading tmux config..."
    tmux source-file ~/.tmux.conf
    echo "✅ Config reloaded"
fi

echo
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                    Installation Complete! 🎉                ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo
echo "📋 What's configured:"
echo "  ✅ Mouse scroll enabled"
echo "  ✅ Scrollback buffer: 50,000 lines"
echo "  ✅ Vi mode enabled"
echo "  ✅ 256 colors support"
echo
echo "🚀 Quick start:"
echo "  1. Start tmux: tmux new -s main"
echo "  2. Test scroll: seq 1 1000"
echo "  3. Scroll with mouse wheel or Ctrl+b then ["
echo
echo "📚 For more info: cat ~/.tmux.conf"
echo "🔄 Reload shell: source ~/.bashrc"
echo
