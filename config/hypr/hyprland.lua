-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- ArchBrigade's bootstrap keeps path setup out of this user config.
dofile((os.getenv("ARCHBRIGADE_PATH") or (os.getenv("HOME") .. "/.local/share/archbrigade")) .. "/default/hypr/bootstrap.lua")

-- Disable all ArchBrigade default bindings. Add your own in hypr/bindings.lua.
-- archbrigade_default_bindings = false

-- Load ArchBrigade defaults (but don't edit those files directly!).
require("default.hypr.archbrigade")

-- Put your personal overrides in these files. They're loaded after
-- ArchBrigade's defaults so package updates can improve the defaults without
-- rewriting your ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.envs")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })
