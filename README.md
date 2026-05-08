# ArchBrigade

Turn a fresh Arch Linux installation into a fully-configured, beautiful, and productive development environment with a single command.

ArchBrigade is a fork of [Omarchy](https://github.com/basecamp/omarchy) (by DHH/37signals) customized for everyday use. It replaces Limine with GRUB, removes mandatory disk encryption, uses SDDM instead of auto-login, and swaps several apps for better alternatives.

## What's different from Omarchy

- **GRUB** instead of Limine — supports dual-boot and no-encryption setups
- **SDDM** login manager instead of auto-login
- **No mandatory disk encryption** — works on any Arch install
- **Bitwarden + rbw** instead of 1Password
- **Zen Browser** instead of Chromium
- **Kitty** as default terminal (with tabs)
- **ZSH** with autosuggestions, syntax highlighting, and pokemon-colorscripts
- **Quickshell workspace overview** (`SUPER+A`)
- **Dropdown terminal** (`SUPER+SHIFT+RETURN`)
- Cleaned up webapps — removed 37signals-specific apps

## Installation

Requires a fresh Arch Linux install (no desktop environment). Then run:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/vmnavarro94/archbrigade/master/boot.sh)
```

The installer will ask about your filesystem (Btrfs or not) and set everything up automatically.

## Key bindings

| Shortcut | Action |
|----------|--------|
| `SUPER+Space` | App launcher |
| `SUPER+Return` | Terminal (kitty) |
| `SUPER+SHIFT+Return` | Dropdown terminal |
| `SUPER+A` | Workspace overview |
| `SUPER+E` | File manager |
| `SUPER+B` | Browser |
| `SUPER+/` | Bitwarden |
| `SUPER+C/X/V` | Universal copy/cut/paste |
| `SUPER+CTRL+V` | Clipboard history |
| `SUPER+SHIFT+S` | Screenshot region |
| `SUPER+SHIFT+R` | Screen record with audio |
| `SUPER+K` | Keybindings cheatsheet |
| `SUPER+SHIFT+CTRL+Space` | Change theme |

## Shell prompt

ArchBrigade uses [agnosterzak](https://github.com/zakaziko99/agnosterzak-ohmyzsh-theme), a Powerline-style oh-my-zsh theme. The prompt shows:

- **Line 1:** `[error X]` → `[date/time]` → `[current directory]` → `[git branch]`
- **Line 2:** `[@username]` + prompt character

### Customizing colors

Colors are defined in `~/.oh-my-zsh/themes/agnosterzak.zsh-theme`. Each segment uses `prompt_segment '<bg-hex>' '<fg-hex>' "content"`.

| Function | Segment | Default bg | Default fg |
|----------|---------|------------|------------|
| `prompt_time` | Date/time | `#1a1b26` | `#c0caf5` |
| `prompt_dir` | Directory | `#7dcfff` | `#1a1b26` |
| `prompt_context` | `@username` | `#e0af68` | `#1a1b26` |
| `prompt_status` | Error indicator | `#1a1b26` | red |

To change a color, edit the relevant function. Example — make directory segment green:

```zsh
# in prompt_dir():
prompt_segment '#9ece6a' '#1a1b26' "%B%~%b"
```

After editing, reload with `source ~/.zshrc` or open a new terminal.

### Changing date format

In `prompt_time()`, edit the `%D{...}` format string:

```zsh
prompt_segment '#1a1b26' '#c0caf5' "%B%D{%a %d %b - %H:%M}%b"
#                                          strftime format ^^^
```

Common tokens: `%a` = weekday, `%d` = day, `%b` = month, `%H:%M` = 24h time.

## Credits

Based on [Omarchy](https://github.com/basecamp/omarchy) by DHH/37signals, and [grubomarchy](https://github.com/LukasKorotaj/grubomarchy) by LukasKorotaj.

## License

MIT
