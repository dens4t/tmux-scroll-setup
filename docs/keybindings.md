# Tmux Keybindings Reference

## Default Prefix Key

```
Ctrl+b    # Default prefix key (press Ctrl+b then another key)
```

## Basic Navigation

### Session Management
```
Ctrl+b d          Detach from session
Ctrl+b s          List sessions (interactive)
Ctrl+b $          Rename session
Ctrl+b L          Switch to last session
Ctrl+b (          Switch to previous session
Ctrl+b )          Switch to next session
```

### Window Management
```
Ctrl+b c          Create new window
Ctrl+b ,          Rename current window
Ctrl+b n          Next window
Ctrl+b p          Previous window
Ctrl+b 0-9        Switch to window number 0-9
Ctrl+b w          List windows (interactive)
Ctrl+b &          Kill current window
Ctrl+b .          Move window
Ctrl+b f          Find window by name
```

### Pane Management
```
Ctrl+b %          Split vertical (right)
Ctrl+b "          Split horizontal (bottom)
Ctrl+b o          Next pane
Ctrl+b ;          Toggle last pane
Ctrl+b x          Kill current pane
Ctrl+b !          Convert pane to window
Ctrl+b q          Show pane numbers (briefly)
Ctrl+b z          Zoom/Unzoom pane
Ctrl+b space      Toggle between pane layouts
```

### Pane Navigation
```
Ctrl+b ←          Move to left pane
Ctrl+b →          Move to right pane
Ctrl+b ↑          Move to upper pane
Ctrl+b ↓          Move to lower pane
Ctrl+b q 0-9      Jump to pane number
Ctrl+b {          Move pane left
Ctrl+b }          Move pane right
```

## Copy Mode

### Entering Copy Mode
```
Ctrl+b [          Enter copy mode
Ctrl+b PageUp     Enter copy mode and page up
Ctrl+b Esc        Enter copy mode (alternative)
```

### Navigation in Copy Mode
```
Arrow keys        Move cursor
Page Up/Down      Move up/down one page
Home/End          Move to start/end of line
Ctrl+u            Half page up
Ctrl+d            Half page down
Ctrl+f            Full page down
Ctrl+b            Full page up
g                 Go to top of buffer
G                 Go to bottom of buffer
/                 Search forward
?                 Search backward
n                 Next match
N                 Previous match
q                 Exit copy mode
```

### Vi Mode Navigation (if `mode-keys vi`)
```
j/k               Down/Up
h/l               Left/Right
w                 Next word
b                 Previous word
^                 Start of line
$                 End of line
H/M/L             Top/Middle/Bottom of screen
Ctrl+d/u          Half page down/up
Ctrl+f/b          Full page down/up
```

### Selection in Copy Mode
```
Space             Start selection
Enter             Copy selection and exit
Esc               Clear selection
v                 Start selection (vi mode)
V                 Start line selection (vi mode)
y                 Copy selection (vi mode)
q                 Exit copy mode
```

## Resizing Panes
```
Ctrl+b Ctrl+←     Resize pane left
Ctrl+b Ctrl+→     Resize pane right
Ctrl+b Ctrl+↑     Resize pane up
Ctrl+b Ctrl+↓     Resize pane down
Ctrl+b Alt+←      Resize pane left by 5
Ctrl+b Alt+→      Resize pane right by 5
Ctrl+b Alt+↑      Resize pane up by 5
Ctrl+b Alt+↓      Resize pane down by 5
```

## Display and Information
```
Ctrl+b t          Show big clock
Ctrl+b ?          List all key bindings
Ctrl+b :          Enter command mode
Ctrl+b i          Display pane information
Ctrl+b ~          Show previous messages
Ctrl+b D          Choose client to detach
Ctrl+b M          Clear marked pane
```

## Mouse Support (with `mouse on`)
```
Left click        Select pane
Drag              Resize pane
Scroll wheel      Scroll in copy mode
Double click      Select word
Triple click      Select line
Right click       Context menu (if supported)
```

## Custom Keybindings (from our configuration)

### Quick Scroll Commands
```
Ctrl+b [          Enter copy mode
Ctrl+b S          Save buffer to file
Ctrl+b R          Reload config
```

### Custom Window Management
```
Ctrl+b |          Split vertical (alternative)
Ctrl+b -          Split horizontal (alternative)
```

### Enhanced Navigation
```
Alt+←             Select left pane (no prefix)
Alt+→             Select right pane (no prefix)
Alt+↑             Select upper pane (no prefix)
Alt+↓             Select lower pane (no prefix)
```

## Bash Aliases (from setup)
```
tm                # Alias for tmux
tmn session       # Create new session
tma session       # Attach to session
tml               # List sessions
tmk session       # Kill session
tmr               # Reload tmux config
tmhelp            # Show help
```

## Command Mode Keys

In command mode (`Ctrl+b :`), you can use:

```
Tab               Auto-complete
↑/↓               Command history
Ctrl+r            Search command history
Ctrl+c            Cancel
Enter             Execute command
```

## Search Mode Keys

In search mode (`/` or `?` in copy mode):

```
Enter             Execute search
Esc               Cancel search
Ctrl+c            Cancel search
Ctrl+r            Toggle regex mode
Ctrl+w            Delete word
Ctrl+u            Delete line
```

## Mode Indicator States

Tmux shows mode indicators in status bar:

```
[COPY]            In copy mode
[PREFIX]          Waiting for second key
[PASTE]           In paste mode
[SEARCH]          In search mode
```

## Timing and Chords

```
Ctrl+b, release, key    Standard prefix chord
Ctrl+b Ctrl+key         Modifier chord
Ctrl+b, wait, key       Slow chord (2 seconds)
```

## Special Character Escapes

To send actual `Ctrl+b` to the terminal:

```
Ctrl+b Ctrl+b     Send Ctrl+b to application
Ctrl+b q          Send prefix to application
```

## Buffer Management

```
Ctrl+b =          List and choose from paste buffer
Ctrl+b p          Paste last buffer
Ctrl+b P          Choose buffer to paste
Ctrl+b #          List all buffers
Ctrl+b -          Delete last buffer
```

## Session Groups

```
Ctrl+b :new-session -s name    Create new session
Ctrl+b :kill-session -t name   Kill session
Ctrl+b :switch-client -t name  Switch to session
```

## Window Synchronization

```
Ctrl+b :setw synchronize-panes on    Type in all panes
Ctrl+b :setw synchronize-panes off   Type in current pane only
```

## Marking and Selection

```
Ctrl+b m          Mark current pane
Ctrl+b M          Clear marked pane
Ctrl+b '          Go to marked pane
```

## Quick Reference Table

| Category | Key | Action |
|----------|-----|--------|
| **Session** | `Ctrl+b d` | Detach |
| **Session** | `Ctrl+b s` | List |
| **Window** | `Ctrl+b c` | New |
| **Window** | `Ctrl+b n` | Next |
| **Pane** | `Ctrl+b %` | Split V |
| **Pane** | `Ctrl+b "` | Split H |
| **Scroll** | `Ctrl+b [` | Copy mode |
| **Scroll** | `Ctrl+b PageUp` | Page up |
| **Resize** | `Ctrl+b Ctrl+←` | Resize left |
| **Info** | `Ctrl+b t` | Clock |
| **Info** | `Ctrl+b i` | Pane info |

## Keybinding Examples

### Custom Bindings Example

```bash
# In .tmux.conf
bind-key -n M-Left select-pane -L
bind-key -n M-Right select-pane -R
bind-key -n M-Up select-pane -U
bind-key -n M-Down select-pane -D

# No prefix needed - just Alt+arrow keys
```

### Mouse Integration

```bash
# With mouse on
# - Click to select pane
# - Drag borders to resize
# - Scroll to navigate history
# - Double-click to select word
```

## Troubleshooting Keys

If keys don't work:

1. Check terminal emulator settings
2. Verify `$TERM` variable
3. Check for conflicts with other applications
4. Test in minimal configuration
5. Try different key combinations

## Learning Tips

1. **Start with basics**: `Ctrl+b d`, `Ctrl+b c`, `Ctrl+b %`
2. **Use aliases**: Our setup includes `tm`, `tml`, etc.
3. **Practice copy mode**: `Ctrl+b [` is essential for scrolling
4. **Customize gradually**: Add bindings as you need them
5. **Use mouse**: With our config, mouse wheel just works

---

**Pro Tip**: Print this reference and keep it near your workspace! 🖨️
