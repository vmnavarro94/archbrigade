-- Application bindings. These live in your config so you can adjust them freely.
-- See current bindings and descriptions with SUPER + K (archbrigade-menu-keybindings).

local terminal = "uwsm app -- kitty"
local browser = "archbrigade-launch-browser"

o.bind("SUPER + RETURN", "Terminal", "archbrigade-launch-terminal")
o.bind("SUPER + SHIFT + RETURN", "Dropdown terminal", "archbrigade-toggle-dropdown")
o.bind("SUPER + E", "File manager", "uwsm app -- nautilus --new-window")
o.bind("SUPER + B", "Browser", browser)
o.bind("SUPER + SHIFT + B", "Browser (private)", browser .. " --private")
o.bind("SUPER + M", "Music", "archbrigade-launch-or-focus spotify")
o.bind("SUPER + N", "Editor", "archbrigade-launch-editor")
o.bind("SUPER + T", "Activity", terminal .. " -e btop")
o.bind("SUPER + D", "Docker", terminal .. " -e lazydocker")
o.bind("SUPER + O", "Obsidian", "archbrigade-launch-or-focus obsidian 'uwsm app -- obsidian -disable-gpu --enable-wayland-ime'")
o.bind("SUPER + slash", "Passwords", "uwsm app -- bitwarden")

-- Web apps.
o.bind("SUPER + Y", "YouTube", o.launch_webapp_sole("YouTube", "https://youtube.com/"))
o.bind("SUPER + SHIFT + G", "WhatsApp", o.launch_webapp_sole("WhatsApp", "https://web.whatsapp.com/"))

-- Screen recording with audio menu (complements ALT + PRINT single-key recording).
o.bind("SUPER + SHIFT + R", "Screen record (audio menu)", "archbrigade-cmd-screenrecord-menu")

-- Change an existing default binding by unbinding it first, then binding the
-- key again. This example puts the ArchBrigade menu on SUPER + SPACE:
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "ArchBrigade menu", "archbrigade-menu")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + CTRL + N")
