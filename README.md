# Tmux Scroll Setup untuk Pi.dev / ttyd

[![Tmux](https://img.shields.io/badge/tmux-3.5a-green.svg)](https://github.com/tmux/tmux)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

Setup lengkap untuk mengaktifkan scrolling di tmux, khususnya untuk web terminal seperti ttyd di pi.dev.

## 🎯 Fitur

- ✅ **Mouse scroll enabled** - Scroll dengan mouse wheel
- ✅ **Scrollback buffer 50,000 baris** - History yang panjang
- ✅ **Vi mode** - Keyboard navigation dengan vi keys
- ✅ **256 colors** - Terminal dengan warna penuh
- ✅ **Clipboard integration** - Copy paste yang mudah
- ✅ **Helper scripts** - Scripts untuk memudahkan penggunaan

## 📦 Instalasi

### Quick Install

```bash
# Download dan setup
curl -fsSL https://raw.githubusercontent.com/dens4t/tmux-scroll-setup/main/install.sh | bash
```

### Manual Install

```bash
# Clone repository
git clone https://github.com/dens4t/tmux-scroll-setup.git
cd tmux-scroll-setup

# Copy konfigurasi
cp .tmux.conf ~/.tmux.conf

# Reload tmux config (jika sudah running)
tmux source-file ~/.tmux.conf
```

## 🖱️ Cara Menggunakan Scroll

### Method 1: Mouse Wheel (Paling Mudah)

Cukup scroll dengan mouse wheel Anda - otomatis bekerja! 🖱️

### Method 2: Keyboard Copy Mode

```bash
1. Tekan: Ctrl+b lalu [     # Masuk copy mode
2. Gunakan: Arrow keys      # Scroll baris per baris
3. Atau: Page Up/Down       # Scroll per halaman
4. Keluar: q                # Exit copy mode
```

### Method 3: Vi Keys (dalam copy mode)

```bash
j/k         # Down/Up (baris per baris)
Ctrl+d/u    # Half page down/up
Ctrl+f/b    # Full page down/up
g           # Jump ke awal buffer
G           # Jump ke akhir buffer (Shift+g)
```

## 📋 Copy & Paste

```bash
1. Ctrl+b [     # Masuk copy mode
2. v            # Mulai selection (vi mode)
3. y            # Copy selection
4. Ctrl+b ]     # Paste
```

## 🚀 Quick Commands

Repository ini menyediakan alias bash yang berguna:

```bash
tm              # Start tmux
tmn mywork      # Buat session baru bernama 'mywork'
tma mywork      # Attach ke session 'mywork'
tml             # List semua session
tmk mywork      # Kill session 'mywork'
tmr             # Reload tmux config
tmhelp          # Tampilkan panduan lengkap
```

## ⚙️ Konfigurasi

File konfigurasi utama: `~/.tmux.conf`

### Key Settings

```bash
# Enable mouse support
set -g mouse on

# Scrollback buffer
set -g history-limit 50000

# Vi mode
setw -g mode-keys vi

# Colors
set -g default-terminal "screen-256color"
```

## 🔧 Troubleshooting

### Mouse scroll tidak bekerja di web terminal?

1. **Gunakan keyboard**: `Ctrl+b` lalu `[`
2. **Reload config**: Jalankan `tmr` atau `tmux source-file ~/.tmux.conf`
3. **Restart tmux**: `exit` dari session lalu buat baru
4. **Refresh browser**: Kadang browser perlu di-refresh

### Scroll tidak menyimpan history?

Cek setting history-limit:

```bash
tmux show-options -g history-limit
# Should output: history-limit 50000
```

### Warna tidak tampil dengan benar?

Pastikan terminal support 256 colors:

```bash
echo $TERM
# Should be: screen-256color atau xterm-256color
```

## 📚 File yang Disediakan

```
tmux-scroll-setup/
├── README.md                   # Dokumentasi ini
├── .tmux.conf                  # Konfigurasi tmux utama
├── install.sh                  # Script instalasi otomatis
├── test-tmux-scroll.sh         # Script untuk test setup
├── tmux-cheatsheet.md          # Cheatsheet cepat
└── docs/
    ├── advanced-config.md      # Konfigurasi lanjutan
    └── keybindings.md          # Daftar lengkap keybindings
```

## 🎯 Use Case: Pi.dev / ttyd

Setup ini khususnya berguna untuk:

- **ttyd** - Web terminal
- **Pi.dev** - Cloud development environment
- **Remote terminal** - SSH melalui browser
- **Shared terminal** - Terminal yang bisa diakses via web

### Contoh untuk ttyd:

```bash
# Login ke web terminal
http://your-server:7681/

# Start tmux
tmux new -s main

# Generate output untuk test scroll
seq 1 1000

# Scroll dengan mouse atau Ctrl+b lalu [
```

## 🌟 Tips & Tricks

### 1. Multiple Panes

```bash
Ctrl+b %        # Split vertical
Ctrl+b "        # Split horizontal
Ctrl+b arrow    # Navigate between panes
```

### 2. Multiple Windows

```bash
Ctrl+b c        # Create new window
Ctrl+b n        # Next window
Ctrl+b p        # Previous window
Ctrl+b 0-9      # Switch to window number
```

### 3. Session Management

```bash
Ctrl+b d        # Detach dari session
tmux attach     # Attach kembali
tmux ls         # List sessions
```

### 4. Search dalam Copy Mode

```bash
Ctrl+b [        # Enter copy mode
/               # Search forward
?               # Search backward
n               # Next match
N               # Previous match
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork repository ini
2. Buat branch feature (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push ke branch (`git push origin feature/AmazingFeature`)
5. Buka Pull Request

## 📝 License

MIT License - lihat file [LICENSE](LICENSE) untuk detail.

## 🙏 Credits

- [Tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [ttyd](https://github.com/tsl0922/ttyd) - Web terminal
- Community contributors

## 📞 Support

Jika ada pertanyaan atau masalah:

- 🐛 [Report bugs](https://github.com/dens4t/tmux-scroll-setup/issues)
- 💬 [Discussions](https://github.com/dens4t/tmux-scroll-setup/discussions)
- 📧 Email: your-email@example.com

## 🔗 Links

- [Tmux Documentation](https://github.com/tmux/tmux/wiki)
- [Tmux Cheat Sheet](https://tmuxcheatsheet.com/)
- [ttyd GitHub](https://github.com/tsl0922/ttyd)

---

**Made with ❤️ for the tmux community**

⭐ Star this repo if you find it helpful!
