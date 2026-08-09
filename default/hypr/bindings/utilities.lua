o.bind("SUPER + SPACE", "ArchBrigade menu", "archbrigade-menu toggle")
o.bind("SUPER + ALT + SPACE", "Apps menu", "archbrigade-menu toggle apps")
o.bind("SUPER + CTRL + E", "Emojis", "archbrigade-shell shell toggle archbrigade.emojis")
o.bind("SUPER + CTRL + C", "Capture menu", "archbrigade-menu toggle capture")
o.bind("SUPER + CTRL + O", "Toggle menu", "archbrigade-menu toggle toggle")
o.bind("SUPER + CTRL + H", "Hardware menu", "archbrigade-menu toggle hardware")
o.bind("SUPER + SHIFT + code:201", "ArchBrigade menu", "archbrigade-menu toggle root")
o.bind("SUPER + ESCAPE", "System menu", "archbrigade-menu toggle system")
o.bind("XF86PowerOff", "Power menu", "archbrigade-menu toggle system", { locked = true })
o.bind("SUPER + K", "Show key bindings", "archbrigade-menu-keybindings")
o.bind("SUPER + ALT + K", "Show Tmux key bindings", "archbrigade-menu-tmux-keybindings")
o.bind("SUPER + CTRL + Q", "Calculator", "omacalc")
o.bind("XF86Calculator", "Calculator", "omacalc")

o.bind_toggle("SUPER + SHIFT + SPACE", "Toggle top bar", "bar")
o.bind("SUPER + CTRL + SPACE", "Background switcher", "archbrigade-menu toggle background")
o.bind("SUPER + SHIFT + CTRL + SPACE", "Theme menu", "archbrigade-menu toggle theme")
o.bind("SUPER + BACKSPACE", "Toggle window transparency", "archbrigade-hyprland-window-transparency-toggle")
o.bind("SUPER + SHIFT + BACKSPACE", "Toggle window gaps", "archbrigade-hyprland-window-gaps-toggle")
o.bind("SUPER + CTRL + BACKSPACE", "Toggle single-window square aspect", "archbrigade-hyprland-window-single-square-aspect-toggle")

-- xkbcommon names the comma keysym "comma"; the upper-case "COMMA" does not match.
o.bind("SUPER + comma", "Dismiss last notification", "archbrigade-shell notifications dismissOne")
o.bind("SUPER + SHIFT + comma", "Dismiss all notifications", "archbrigade-shell notifications dismissAll")
o.bind_toggle("SUPER + CTRL + comma", "Toggle silencing notifications", "notification-silencing")
o.bind("SUPER + ALT + comma", "Invoke last notification", "archbrigade-shell notifications invokeLast")
o.bind("SUPER + SHIFT + ALT + comma", "Open notification history", "archbrigade-shell notifications showHistory")

o.bind_toggle("SUPER + CTRL + I", "Toggle locking on idle", "idle")
o.bind_toggle("SUPER + CTRL + N", "Toggle nightlight", "nightlight")
o.bind("SUPER + CTRL + Delete", "Toggle laptop display", "archbrigade-hyprland-monitor-internal toggle")
o.bind("SUPER + CTRL + ALT + Delete", "Toggle laptop display mirroring", "archbrigade-hyprland-monitor-internal-mirror toggle")
o.bind("switch:on:Lid Switch", nil, "archbrigade-system-lid-close", { locked = true })
o.bind("switch:off:Lid Switch", nil, "archbrigade-hyprland-monitor-clamshell", { locked = true })

o.bind("PRINT", "Screenshot", "archbrigade-capture-screenshot")
o.bind("ALT + PRINT", "Screenrecording", "archbrigade-capture-screenrecording --stop-recording || archbrigade-menu toggle trigger.capture.screenrecord")
o.bind("SUPER + ALT + code:34", "Make webcam overlay smaller", "archbrigade-capture-webcam-resize smaller")
o.bind("SUPER + ALT + code:35", "Make webcam overlay larger", "archbrigade-capture-webcam-resize larger")
o.bind("SUPER + PRINT", "Color picker", "pkill hyprpicker || hyprpicker -a")
o.bind("SUPER + CTRL + PRINT", "Extract text (OCR) from screenshot", "archbrigade-capture-text")

-- While the slurp region picker is open, Return captures the entire focused
-- monitor. The bind lives exactly as long as a selection layer is on screen
-- (slurp opens one per monitor), so it cannot leak or get stuck.
local selection_layers = 0

hl.on("layer.opened", function(layer)
  if layer.namespace == "selection" then
    selection_layers = selection_layers + 1
    if selection_layers == 1 then
      hl.bind("RETURN", hl.dsp.exec_cmd("archbrigade-capture-region --take-fullscreen"), { description = "Capture entire screen" })
    end
  end
end)

hl.on("layer.closed", function(layer)
  if layer.namespace == "selection" and selection_layers > 0 then
    selection_layers = selection_layers - 1
    if selection_layers == 0 then
      hl.unbind("RETURN")
    end
  end
end)

o.bind("SUPER + CTRL + S", "Share", "archbrigade-menu toggle share")

o.bind("SUPER + CTRL + PERIOD", "Transcode", "archbrigade-transcode")

o.bind("SUPER + CTRL + R", "Set reminder", "archbrigade-menu toggle reminder-set")
o.bind("SUPER + CTRL + ALT + R", "Show reminders", "archbrigade-reminder show")
o.bind("SUPER + SHIFT + CTRL + R", "Clear reminders", "archbrigade-reminder clear")

o.bind("SUPER + CTRL + ALT + T", "Show time", "archbrigade-notification-time")
o.bind("SUPER + CTRL + ALT + B", "Show battery remaining", "archbrigade-notification-battery")
o.bind("SUPER + CTRL + ALT + W", "Toggle weather", "archbrigade-notification-weather")

o.bind("SUPER + SHIFT + CTRL + A", "Agent", "archbrigade-launch-agent")
o.bind("SUPER + CTRL + A", "Audio", "archbrigade-shell shell toggle archbrigade.audio")
o.bind("SUPER + CTRL + B", "Bluetooth", "archbrigade-shell shell toggle archbrigade.bluetooth")
o.bind("SUPER + CTRL + D", "Display", "archbrigade-shell shell toggle archbrigade.monitor")
o.bind("SUPER + CTRL + ALT + D", "Calendar", "archbrigade-shell shell toggle archbrigade.clock")
o.bind("SUPER + CTRL + W", "Network", "archbrigade-shell shell toggle archbrigade.network")
o.bind("SUPER + CTRL + P", "Power", "archbrigade-shell shell toggle archbrigade.power")
o.bind("SUPER + CTRL + T", "Activity", { tui = "btop" })

o.bind("SUPER + CTRL + Z", "Zoom in", function()
  local zoom = hl.get_config("cursor.zoom_factor") or 1
  hl.config({ cursor = { zoom_factor = zoom + 1 } })
end)

o.bind("SUPER + CTRL + ALT + Z", "Reset zoom", function()
  hl.config({ cursor = { zoom_factor = 1 } })
end)

o.bind("SUPER + CTRL + L", "Lock system", "archbrigade-system-lock")
