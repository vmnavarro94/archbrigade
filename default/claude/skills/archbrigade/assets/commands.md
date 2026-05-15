# ArchBrigade Script Reference

No unified CLI. All commands are individual `archbrigade-*` scripts in `~/.local/share/archbrigade/bin/`.

## Theme

```bash
archbrigade-theme-list              # Available themes
archbrigade-theme-current           # Current theme name
archbrigade-theme-set <name>        # Apply theme (lowercase, dashes: "tokyo-night")
archbrigade-theme-bg-next           # Cycle background
archbrigade-theme-next              # Cycle to next theme
archbrigade-theme-install <url>     # Install from git repo
```

Themes live in `~/.config/archbrigade/themes/`. Active theme is a symlink at `~/.config/archbrigade/current/theme`.

## Restart (apply config changes)

```bash
archbrigade-restart-waybar
archbrigade-restart-walker
archbrigade-restart-swayosd
archbrigade-restart-hypridle
archbrigade-restart-hyprsunset
archbrigade-restart-pipewire
archbrigade-restart-bluetooth
archbrigade-restart-wifi
```

## Refresh (reset config to defaults — CONFIRM FIRST)

```bash
archbrigade-refresh-waybar          # Resets config.jsonc + style.css, then restarts
archbrigade-refresh-hyprland
archbrigade-refresh-hypridle
archbrigade-refresh-hyprlock
archbrigade-refresh-walker
archbrigade-refresh-config <path>   # Refresh a specific file (relative to ~/.config/)
```

## Toggle

```bash
archbrigade-toggle-nightlight
archbrigade-toggle-idle
archbrigade-toggle-dropdown         # Dropdown terminal
archbrigade-toggle-waybar
archbrigade-toggle-screensaver
```

## Package Management

```bash
archbrigade-pkg-add <pkg>           # Install pacman package
archbrigade-pkg-aur-install <pkg>   # Install AUR package
archbrigade-pkg-remove <pkg>
archbrigade-pkg-drop <pkg>          # Mark package as ignored
```

## Capture / Media

```bash
archbrigade-cmd-screenshot          # Screenshot
archbrigade-cmd-screenrecord        # Screen record
archbrigade-cmd-screenrecord-menu   # Screen record with audio source menu
archbrigade-screenrecord-toggle     # Toggle recording
```

## Font

```bash
archbrigade-font-list
archbrigade-font-current
archbrigade-font-set <name>
```

## System

```bash
archbrigade-lock-screen
archbrigade-update                  # System update
archbrigade-version                 # Show version
archbrigade-upload-log              # Upload logs for support
archbrigade-menu-keybindings --print  # Print current keybindings
```

## Launch Helpers

```bash
archbrigade-launch-terminal
archbrigade-launch-browser
archbrigade-launch-editor
archbrigade-launch-or-focus <class> <cmd>
archbrigade-launch-or-focus-webapp <title> <url>
```
