# Tmux Scroll Cheatsheet

## 🖱️ Scrolling Methods

### Method 1: Mouse Wheel (Recommended)
- **Scroll up/down**: Just use your mouse wheel
- **Works automatically** in tmux with `mouse on`

### Method 2: Keyboard Copy Mode
```
Ctrl+b [        Enter copy mode
Arrow keys      Scroll line by line
Page Up/Down    Scroll page by page
Home/End        Jump to start/end of line
g               Jump to top of buffer
G               Jump to bottom of buffer (Shift+g)
q               Exit copy mode
```

### Method 3: Vi Keys (in copy mode)
```
j               Move down one line
k               Move up one line
h               Move left
l               Move right
Ctrl+d          Half page down
Ctrl+u          Half page up
Ctrl+f          Full page down
Ctrl+b          Full page up
```

## 📋 Copy & Paste

```
Ctrl+b [        Enter copy mode
v               Start selection (vi mode)
y               Copy selection
Ctrl+b ]        Paste
```

## 🪟 Window Management

```
Ctrl+b c        Create new window
Ctrl+b ,        Rename current window
Ctrl+b n        Next window
Ctrl+b p        Previous window
Ctrl+b 0-9      Switch to window number
Ctrl+b w        List windows
Ctrl+b &        Kill current window
```

## 📐 Pane Management

```
Ctrl+b %        Split vertical
Ctrl+b "        Split horizontal
Ctrl+b ←↑→↓     Switch pane (arrow keys)
Ctrl+b o        Next pane
Ctrl+b x        Kill current pane
Ctrl+b z        Toggle pane zoom
Ctrl+b {        Move pane left
Ctrl+b }        Move pane right
Ctrl+b space    Toggle pane layouts
```

## 🎮 Session Management

```
tmux new -s name    Create new session with name
tmux ls             List all sessions
tmux attach -t name Attach to session
tmux kill-session   Kill current session
Ctrl+b d            Detach from session
Ctrl+b $            Rename session
Ctrl+b s            List sessions (interactive)
```

## 🔍 Search in Copy Mode

```
Ctrl+b [        Enter copy mode
/               Search forward
?               Search backward
n               Next match
N               Previous match
```

## ⚙️ Configuration

```
tmux source-file ~/.tmux.conf    Reload config
tmux show-options -g             Show all options
tmux show-options -g mouse       Show mouse option
tmux set -g mouse on             Enable mouse (runtime)
```

## 🚀 Useful Aliases

Add to `~/.bashrc`:

```bash
alias tm='tmux'
alias tma='tmux attach -t'
alias tmn='tmux new -s'
alias tml='tmux ls'
alias tmk='tmux kill-session -t'
alias tmr='tmux source-file ~/.tmux.conf'
```

## 💡 Tips & Tricks

### 1. Scroll in man pages or less
Just use mouse wheel or copy mode - works automatically!

### 2. Persistent sessions
```bash
# Start named session
tmux new -s work

# Detach: Ctrl+b d
# Later, reattach from anywhere:
tmux attach -t work
```

### 3. Copy to system clipboard (Linux)
Install `xclip`:
```bash
sudo apt-get install xclip
```

Add to `.tmux.conf`:
```bash
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
```

### 4. Synchronized panes
Type in multiple panes at once:
```
Ctrl+b :setw synchronize-panes on
```

### 5. Resize panes
```
Ctrl+b Ctrl+←↑→↓    Resize pane (hold Ctrl)
```

## 🐛 Troubleshooting

### Mouse scroll not working?
1. Check: `tmux show-options -g mouse` (should be "on")
2. Reload config: `tmux source-file ~/.tmux.conf`
3. Try keyboard: `Ctrl+b [`

### Can't see colors?
1. Check: `echo $TERM` (should be `screen-256color`)
2. Add to `.tmux.conf`:
   ```
   set -g default-terminal "screen-256color"
   ```

### Prefix key not working?
Default prefix is `Ctrl+b`. If changed, check `.tmux.conf`:
```bash
set -g prefix C-b
```

## 📊 Status Bar Customization

```bash
# Show/hide status bar
Ctrl+b :set -g status off
Ctrl+b :set -g status on

# Position
set -g status-position top    # or bottom
```

## 🎨 Theme Customization

Example color scheme in `.tmux.conf`:
```bash
# Status bar colors
set -g status-bg colour235
set -g status-fg colour136

# Active pane border
set -g pane-active-border-style fg=colour166

# Window status
setw -g window-status-current-style fg=colour166,bg=colour238,bold
```

## ⌨️ Custom Keybindings

Example custom bindings:
```bash
# Reload config with r
bind r source-file ~/.tmux.conf \; display "Config reloaded!"

# Split with | and -
bind | split-window -h
bind - split-window -v

# Switch panes with Alt+arrow (no prefix)
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
```

## 📚 Additional Resources

- [Tmux Official Wiki](https://github.com/tmux/tmux/wiki)
- [Tmux Manual](https://man7.org/linux/man-pages/man1/tmux.1.html)
- [Tmux Cheat Sheet](https://tmuxcheatsheet.com/)

---

**Quick Reference Card - Print this!** 🖨️

```
┌─────────────────────────────────────────────────┐
│ TMUX QUICK REFERENCE                            │
├─────────────────────────────────────────────────┤
│ Prefix: Ctrl+b                                  │
│                                                 │
│ SCROLL:                                         │
│   Mouse wheel      ↕️  Scroll up/down           │
│   Ctrl+b [         Enter copy mode             │
│   q                Exit copy mode              │
│                                                 │
│ WINDOWS:                                        │
│   c  New    n  Next    p  Previous             │
│                                                 │
│ PANES:                                          │
│   %  Split V    "  Split H    ←↑→↓  Navigate  │
│                                                 │
│ SESSION:                                        │
│   d  Detach    s  List    $  Rename            │
└─────────────────────────────────────────────────┘
```
