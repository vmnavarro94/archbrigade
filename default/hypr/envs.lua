local paths = require("default.hypr.paths")
local require_optional = require("default.hypr.require_optional")

-- GUM environment variables for styling purposes (optional theme module).
require_optional.module("archbrigade.current.theme.gum_env")

-- ArchBrigade bin path first on PATH.
local bin_dir = paths.archbrigade_path .. "/bin"
local kept = {}
for entry in (os.getenv("PATH") or "/usr/local/bin:/usr/bin"):gmatch("[^:]+") do
  if entry ~= bin_dir then table.insert(kept, entry) end
end
table.insert(kept, 1, bin_dir)
hl.env("PATH", table.concat(kept, ":"))

-- hyprctl setenv doesn't reach keybind dispatcher env; use hl.env.
hl.env("ARCHBRIGADE_PATH", paths.archbrigade_path)

-- Default terminal and editor.
hl.env("TERMINAL", "kitty")
hl.env("EDITOR", "nvim")

-- Cursor size.
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Force all apps to use Wayland.
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- Allow better support for screen sharing (Google Meet, Discord, etc).
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Use XCompose file.
hl.env("XCOMPOSEFILE", paths.home .. "/.XCompose")

-- Force dark theme for all GTK/Qt apps.
hl.env("GTK_THEME", "Adwaita:dark")
hl.env("ADW_DISABLE_PORTAL", "1")

-- Hardware-specific environment.
require("default.hypr.nvidia")

hl.config({
  xwayland = {
    force_zero_scaling = true,
  },

  -- Don't show update news on first launch.
  ecosystem = {
    no_update_news = true,
  },
})
