-- Menus.
o.bind("SUPER + SPACE", "Launch apps", [[uwsm app -- walker -p "Start…"]])
o.bind("SUPER + CTRL + E", "Emoji picker", "uwsm app -- walker -m Emojis")
o.bind("SUPER + A", "Workspace overview", "archbrigade-overview-toggle")
o.bind("SUPER + ALT + SPACE", "ArchBrigade menu", "archbrigade-menu")
o.bind("SUPER + ESCAPE", "Power menu", "archbrigade-menu system")
o.bind("XF86PowerOff", "Power menu", "archbrigade-menu system", { locked = true })
o.bind("SUPER + K", "Show key bindings", "archbrigade-menu-keybindings")
o.bind("XF86Calculator", "Calculator", "qalculate-gtk")
o.bind("SUPER + CTRL + H", "Hardware menu", [[uwsm app -- kitty --class archbrigade-screenrecord --title "Hardware" -e archbrigade-menu-hardware]])
o.bind("SUPER + ALT + S", "Capture menu", [[uwsm app -- kitty --class archbrigade-screenrecord --title "Capture" -e archbrigade-menu-capture]])

-- Quick info.
o.bind("SUPER + CTRL + B", "Battery status", [[bash -c 'BATTERY=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null | head -1); STATUS=$(cat /sys/class/power_supply/BAT*/status 2>/dev/null | head -1); notify-send "Battery" "${BATTERY}% — ${STATUS}" -t 3000']])

-- Aesthetics.
o.bind_toggle("SUPER + SHIFT + SPACE", "Toggle top bar", "waybar")
o.bind("SUPER + CTRL + SPACE", "Next background in theme", "archbrigade-theme-bg-next")
o.bind("SUPER + SHIFT + CTRL + SPACE", "Pick new theme", "archbrigade-menu theme")
o.bind("SUPER + BACKSPACE", "Toggle window transparency", [[hyprctl dispatch setprop "address:$(hyprctl activewindow -j | jq -r '.address')" opaque toggle]])
o.bind("SUPER + SHIFT + BACKSPACE", "Toggle window gaps", "archbrigade-cmd-window-gaps-toggle")

-- Notifications.
-- xkbcommon names the comma keysym "comma"; the upper-case "COMMA" does not match.
o.bind("SUPER + comma", "Dismiss last notification", "makoctl dismiss")
o.bind("SUPER + SHIFT + comma", "Dismiss all notifications", "makoctl dismiss --all")
o.bind("SUPER + CTRL + comma", "Toggle silencing notifications", [[makoctl mode -t do-not-disturb && makoctl mode | grep -q 'do-not-disturb' && notify-send "Silenced notifications" || notify-send "Enabled notifications"]])
o.bind("SUPER + ALT + comma", "Invoke last notification", "makoctl invoke")

-- Lock screen and idling.
o.bind("SUPER + L", "Lock screen", "archbrigade-lock-screen")
o.bind_toggle("SUPER + CTRL + I", "Toggle locking on idle", "idle")

-- Toggle nightlight.
o.bind_toggle("SUPER + CTRL + N", "Toggle nightlight", "nightlight")

-- Control Apple Display brightness.
o.bind("CTRL + F1", "Apple Display brightness down", "archbrigade-cmd-apple-display-brightness -5000")
o.bind("CTRL + F2", "Apple Display brightness up", "archbrigade-cmd-apple-display-brightness +5000")
o.bind("SHIFT + CTRL + F2", "Apple Display full brightness", "archbrigade-cmd-apple-display-brightness +60000")

-- Screenshots.
o.bind("SUPER + CTRL + PRINT", "Extract text from region", "archbrigade-cmd-text-extraction")
o.bind("SUPER + SHIFT + S", "Screenshot of region", "archbrigade-cmd-screenshot")
o.bind("PRINT", "Screenshot of region", "archbrigade-cmd-screenshot")
o.bind("SHIFT + PRINT", "Screenshot of window", "archbrigade-cmd-screenshot window")
o.bind("CTRL + PRINT", "Screenshot of display", "archbrigade-cmd-screenshot output")

-- Screen recordings.
o.bind("ALT + PRINT", "Screen record a region", "archbrigade-cmd-screenrecord region")
o.bind("ALT + SHIFT + PRINT", "Screen record a region with audio", "archbrigade-cmd-screenrecord region audio")
o.bind("CTRL + ALT + PRINT", "Screen record display", "archbrigade-cmd-screenrecord output")
o.bind("CTRL + ALT + SHIFT + PRINT", "Screen record display with audio", "archbrigade-cmd-screenrecord output audio")

-- Color picker.
o.bind("SUPER + PRINT", "Color picker", "pkill hyprpicker || hyprpicker -a")

-- File sharing.
o.bind("SUPER + CTRL + S", "Share", "archbrigade-menu share")

-- Zoom.
o.bind("SUPER + CTRL + Z", "Zoom in", "archbrigade-cmd-zoom-in")
o.bind("SUPER + CTRL + ALT + Z", "Reset zoom", "hyprctl keyword cursor:zoom_factor 1")
