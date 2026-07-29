# Advanced Configuration Guide

## Overview

This document covers advanced tmux configuration options beyond the basic scroll setup.

## Performance Optimization

### Reduce Escape Time

```bash
# Faster response for escape sequences (vim, etc.)
set -sg escape-time 10
```

### Optimize Refresh Rate

```bash
# Limit status bar updates to reduce CPU usage
set -g status-interval 15
```

### Limit History Search

```bash
# Increase search history limit for large sessions
set -g history-limit 100000
```

## Enhanced Mouse Support

### Mouse Drag

```bash
# Enable mouse drag for resizing panes
set -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M
```

### Mouse Scroll Speed

```bash
# Control mouse scroll speed (tmux 3.1+)
set -g mouse-scroll-speed 3
```

## Theme Customization

### Custom Status Bar

```bash
# Status bar colors
set -g status-style "fg=#586e75,bg=#073642"
set -g status-left "#[fg=#93a1a1,bg=#073642] #S #[fg=#073642,bg=#268bd2]"
set -g status-right "#[fg=#586e75,bg=#073642] %Y-%m-%d %H:%M #[fg=#93a1a1,bg=#586e75]#[fg=#073642,bg=#93a1a1] #H "

# Window status
setw -g window-status-current-format "#[fg=#268bd2,bg=#073642]#[fg=#fdf6e3,bg=#268bd2] #I:#W #[fg=#268bd2,bg=#073642]"
setw -g window-status-format "#[fg=#586e75,bg=#073642] #I:#W "
```

### Color Schemes

```bash
# Solarized Dark Theme
set -g status-bg colour235
set -g status-fg colour136
set -g pane-active-border-style fg=colour166
set -g message-style fg=colour166,bg=colour235

# Nord Theme
set -g status-bg colour235
set -g status-fg colour250
set -g pane-active-border-style fg=colour109
set -g message-style fg=colour109,bg=colour235
```

## Keyboard Bindings

### Custom Prefix

```bash
# Change prefix from Ctrl+b to Ctrl+a (like screen)
unbind C-b
set -g prefix C-a
bind C-a send-prefix
```

### Simplified Keybindings

```bash
# No prefix needed for common operations
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Alt+Shift+arrow to resize panes
bind -n M-S-Left resize-pane -L 5
bind -n M-S-Right resize-pane -R 5
bind -n M-S-Up resize-pane -U 5
bind -n M-S-Down resize-pane -D 5
```

### Quick Window Management

```bash
# Quick window switching with Alt+number
bind -n M-1 select-window -t 1
bind -n M-2 select-window -t 2
bind -n M-3 select-window -t 3
bind -n M-4 select-window -t 4
bind -n M-5 select-window -t 5
bind -n M-6 select-window -t 6
bind -n M-7 select-window -t 7
bind -n M-8 select-window -t 8
bind -n M-9 select-window -t 9
```

## Clipboard Integration

### System Clipboard (Linux)

```bash
# Requires xclip
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
```

### System Clipboard (macOS)

```bash
# Requires reattach-to-user-namespace
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'
```

### Windows Subsystem for Linux (WSL)

```bash
# Using clip.exe
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'clip.exe'
```

## Plugin System

### Tmux Plugin Manager (TPM)

Add to `.tmux.conf`:

```bash
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'christoomey/vim-tmux-navigator'

# Initialize TPM (keep at bottom)
run '~/.tmux/plugins/tpm/tpm'
```

### Useful Plugins

1. **tmux-resurrect** - Restore tmux sessions after restart
2. **tmux-continuum** - Automatic saving/restoring
3. **vim-tmux-navigator** - Seamless vim/tmux navigation
4. **tmux-yank** - Enhanced copy/paste
5. **tmux-battery** - Battery status in status bar

## Session Management

### Auto-start Sessions

```bash
# Auto-start named sessions on login
if-shell "[ -z $TMUX ] && [ $(tmux list-sessions | grep -c '^main:') -eq 0 ]" "tmux new -s main"
```

### Session Switching

```bash
# Quick session switching
bind S command-prompt -p "New session:" "new-session -A -s '%%'"
bind s choose-tree -s
```

### Session Persistence

```bash
# Save session every 15 minutes
set -g @continuum-save-interval '15'
set -g @continuum-restore 'on'
```

## Performance Tuning

### Large Scrollback Buffer

```bash
# Increase buffer for long-running processes
set -g history-limit 100000

# Optimize memory usage for large buffers
set -g buffer-limit 5000
```

### Fast Scrolling

```bash
# Optimize rendering performance
set -g aggressive-resize on
set -g repeat-time 300
```

### Network Performance

```bash
# Adjust for high-latency connections
set -g escape-time 50
set -g focus-events on
```

## Integration with Other Tools

### Vim Integration

```bash
# Seamless navigation between vim and tmux
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
```

### Git Integration

```bash
# Show git branch in status bar
set -g status-right '#{git_branch} #(whoami)@#h | %Y-%m-%d %H:%M '
```

### SSH Integration

```bash
# Auto-attach to existing sessions over SSH
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  if [ -z "$TMUX" ]; then
    tmux attach-session -t ssh || tmux new-session -s ssh
  fi
fi
```

## Security Considerations

### Disable Remote Access

```bash
# Disable remote connections to tmux socket
set -g lock-after-time 1800
set -g destroy-unattached off
```

### Secure Session Management

```bash
# Require password for detach
set -g lock-command vlock
set -g lock-server on
```

## Troubleshooting

### Debug Mode

```bash
# Enable debug logging
set -g display-time 0
set -g status-interval 1
```

### Performance Monitoring

```bash
# Monitor tmux memory usage
watch -n 1 "ps aux | grep tmux | grep -v grep"
```

### Reset Configuration

```bash
# Reset to defaults
tmux kill-server
rm ~/.tmux.conf
tmux
```

## Configuration Versioning

```bash
# Add version tracking
set -g @config-version "1.0.0"
set -g @config-last-updated "2026-07-29"
```

---

For more information, see the [Tmux Manual](https://man7.org/linux/man-pages/man1/tmux.1.html).
