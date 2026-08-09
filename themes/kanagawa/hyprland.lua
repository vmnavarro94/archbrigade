-- Kanagawa theme overrides for Hyprland.

hl.config({
  general = {
    col = {
      active_border = "rgb(dcd7ba)",
    },
  },
})

-- Kanagawa backdrop is too strong for default opacity.
o.window({ tag = "terminal" }, { opacity = "0.98 0.95" })
