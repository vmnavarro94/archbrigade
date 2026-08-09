-- Floating windows.
o.window({ tag = "floating-window" }, { float = true })
o.window({ tag = "floating-window" }, { center = true })
o.window({ tag = "floating-window" }, { size = { 800, 600 } })
o.window("archbrigade-screenrecord", { size = { 500, 300 } })

o.window(
  "(blueberry.py|Impala|Wiremix|org.gnome.NautilusPreviewer|com.gabm.satty|ArchBrigade|About|TUI.float|archbrigade-screenrecord|qalculate-gtk|org.gnome.Calculator)",
  { tag = "+floating-window" }
)
o.window({
  class = "(xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus)",
  title = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files)",
}, { tag = "+floating-window" })

-- Dropdown terminal (80% width centered, 40% height, pinned to top).
o.window("archbrigade-dropdown", { float = true })
o.window("archbrigade-dropdown", { workspace = "special:dropdown" })
o.window("archbrigade-dropdown", { size = { 2048, 576 } })
o.window("archbrigade-dropdown", { move = { 256, 0 } })

-- Fullscreen screensaver.
o.window("Screensaver", { fullscreen = true })

-- No transparency on media windows.
o.window(
  "^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$",
  { opacity = "1 1" }
)
