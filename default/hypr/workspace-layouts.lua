-- Restore workspace layouts saved by archbrigade-hyprland-workspace-layout-toggle.

local paths = require("default.hypr.paths")
local require_all = require("default.hypr.require_all")

local layouts_dir = paths.state_home .. "/archbrigade/workspace-layouts"

require_all.files(layouts_dir, "archbrigade.workspace-layouts", { reload = true })
