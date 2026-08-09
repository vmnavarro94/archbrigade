-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all
--
-- NOTE: nwg-displays generates Hyprland .conf syntax (monitors.conf) and does
-- not understand this Lua file. Until that integration is reworked (Phase 2),
-- configure monitors by hand here instead of using nwg-displays.

-- Optimized for retina-class 2x displays, like 13" 2.8K, 27" 5K, 32" 6K.
local archbrigade_gdk_scale = 2
local archbrigade_monitor_scale = "auto"

hl.env("GDK_SCALE", tostring(archbrigade_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = archbrigade_monitor_scale })

-- Good compromise for 27" or 32" 4K monitors (but fractional!):
-- hl.env("GDK_SCALE", "1.75")
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1.666667 })

-- Straight 1x setup for low-resolution displays like 1080p or 1440p:
-- hl.env("GDK_SCALE", "1")
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

-- Configure a specific monitor:
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90 deg, 3 = 270 deg):
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })

-- Example for Framework 13 w/ 6K XDR Apple display:
-- hl.monitor({ output = "DP-5", mode = "6016x3384@60", position = "auto", scale = 2 })
-- hl.monitor({ output = "eDP-1", mode = "2880x1920@120", position = "auto", scale = 2 })
