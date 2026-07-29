#!/bin/bash

echo "🧪 Testing Tmux Scroll Configuration"
echo "===================================="
echo

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "❌ Tmux not installed"
    exit 1
fi

echo "✅ Tmux version: $(tmux -V)"
echo

# Check config file
if [ -f ~/.tmux.conf ]; then
    echo "✅ Config file exists: ~/.tmux.conf"
else
    echo "❌ Config file not found"
    exit 1
fi

# Check mouse setting
MOUSE=$(tmux show-options -g mouse 2>/dev/null | awk '{print $2}')
if [ "$MOUSE" = "on" ]; then
    echo "✅ Mouse mode: enabled"
else
    echo "⚠️  Mouse mode: disabled"
fi

# Check history limit
HISTORY=$(tmux show-options -g history-limit 2>/dev/null | awk '{print $2}')
echo "✅ Scrollback buffer: $HISTORY lines"

echo
echo "📝 Quick Reference:"
echo "-------------------"
echo "Mouse wheel       : Scroll up/down (otomatis)"
echo "Ctrl+b then [     : Enter copy mode"
echo "Page Up/Down      : Scroll dalam copy mode"
echo "q                 : Exit copy mode"
echo
echo "Type 'tmhelp' untuk panduan lengkap"
echo
echo "🎯 Untuk test scrolling:"
echo "1. Buat session baru: tmux new -s test"
echo "2. Generate banyak output: seq 1 1000"
echo "3. Coba scroll dengan mouse wheel"
echo "4. Atau tekan Ctrl+b lalu [ untuk copy mode"
