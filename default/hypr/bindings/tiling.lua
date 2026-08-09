-- Close windows.
o.bind("SUPER + W", "Close active window", hl.dsp.window.close())
o.bind("SUPER + Q", "Quit app", "archbrigade-cmd-quit")
o.bind("CTRL + ALT + DELETE", "Close all windows", "archbrigade-cmd-close-all-windows")

-- Control tiling.
o.bind("SUPER + J", "Toggle split", hl.dsp.layout("togglesplit"))
o.bind("SUPER + P", "Pseudo window", hl.dsp.window.pseudo())
o.bind("SUPER + F", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))
o.bind("SHIFT + F11", "Force full screen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
o.bind("ALT + F11", "Full width", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Move focus with SUPER + arrow keys.
o.bind("SUPER + LEFT", "Move focus left", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + RIGHT", "Move focus right", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + UP", "Move focus up", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + DOWN", "Move focus down", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces with SUPER + [0-9]; move windows with SUPER + SHIFT + [0-9].
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  o.bind("SUPER + " .. key, "Switch to workspace " .. workspace, hl.dsp.focus({ workspace = tostring(workspace) }))
  o.bind("SUPER + SHIFT + " .. key, "Move window to workspace " .. workspace, hl.dsp.window.move({ workspace = tostring(workspace) }))
end

-- Tab between workspaces.
o.bind("SUPER + TAB", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
o.bind("SUPER + SHIFT + TAB", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))
o.bind("SUPER + CTRL + TAB", "Former workspace", hl.dsp.focus({ workspace = "previous" }))

-- Swap active window with the one next to it with SUPER + SHIFT + arrow keys.
o.bind("SUPER + SHIFT + LEFT", "Swap window to the left", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + SHIFT + RIGHT", "Swap window to the right", hl.dsp.window.swap({ direction = "r" }))
o.bind("SUPER + SHIFT + UP", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + SHIFT + DOWN", "Swap window down", hl.dsp.window.swap({ direction = "d" }))

-- Cycle through applications on active workspace.
o.bind("ALT + TAB", "Cycle to next window", hl.dsp.window.cycle_next())
o.bind("ALT + SHIFT + TAB", "Cycle to prev window", hl.dsp.window.cycle_next({ next = false }))
o.bind("ALT + TAB", "Reveal active window on top", hl.dsp.window.bring_to_top())
o.bind("ALT + SHIFT + TAB", "Reveal active window on top", hl.dsp.window.bring_to_top())

-- Resize active window.
o.bind("SUPER + code:20", "Expand window left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
o.bind("SUPER + code:21", "Shrink window left", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
o.bind("SUPER + SHIFT + code:20", "Shrink window up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
o.bind("SUPER + SHIFT + code:21", "Expand window down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

-- Resize a lot.
o.bind("SUPER + CTRL + code:20", "Expand window left a lot", hl.dsp.window.resize({ x = -300, y = 0, relative = true }))
o.bind("SUPER + CTRL + code:21", "Shrink window left a lot", hl.dsp.window.resize({ x = 300, y = 0, relative = true }))
o.bind("SUPER + SHIFT + CTRL + code:20", "Shrink window up a lot", hl.dsp.window.resize({ x = 0, y = -300, relative = true }))
o.bind("SUPER + SHIFT + CTRL + code:21", "Expand window down a lot", hl.dsp.window.resize({ x = 0, y = 300, relative = true }))

-- Scroll through existing workspaces with SUPER + scroll.
o.bind("SUPER + mouse_down", "Scroll active workspace forward", hl.dsp.focus({ workspace = "e+1" }))
o.bind("SUPER + mouse_up", "Scroll active workspace backward", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with SUPER + LMB/RMB and dragging.
o.bind("SUPER + mouse:272", "Move window", hl.dsp.window.drag(), { mouse = true })
o.bind("SUPER + mouse:273", "Resize window", hl.dsp.window.resize(), { mouse = true })

-- Scratchpad.
o.bind("SUPER + S", "Toggle scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
o.bind("SUPER + SHIFT + ALT + S", "Move window to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- Window groups.
o.bind("SUPER + G", "Toggle window group", hl.dsp.group.toggle())
o.bind("SUPER + ALT + G", "Move window out of group", hl.dsp.window.move({ out_of_group = true }))
o.bind("SUPER + ALT + LEFT", "Move window into group left", hl.dsp.window.move({ into_group = "l" }))
o.bind("SUPER + ALT + RIGHT", "Move window into group right", hl.dsp.window.move({ into_group = "r" }))
o.bind("SUPER + ALT + UP", "Move window into group up", hl.dsp.window.move({ into_group = "u" }))
o.bind("SUPER + ALT + DOWN", "Move window into group down", hl.dsp.window.move({ into_group = "d" }))
o.bind("SUPER + ALT + TAB", "Next window in group", hl.dsp.group.next())
o.bind("SUPER + ALT + SHIFT + TAB", "Previous window in group", hl.dsp.group.prev())

-- Monitor navigation.
o.bind("CTRL + ALT + TAB", "Focus next monitor", hl.dsp.focus({ monitor = "+1" }))
o.bind("CTRL + ALT + SHIFT + TAB", "Focus previous monitor", hl.dsp.focus({ monitor = "-1" }))
o.bind("SUPER + SHIFT + ALT + LEFT", "Move workspace to left monitor", hl.dsp.workspace.move({ monitor = "l" }))
o.bind("SUPER + SHIFT + ALT + RIGHT", "Move workspace to right monitor", hl.dsp.workspace.move({ monitor = "r" }))
o.bind("SUPER + SHIFT + ALT + UP", "Move workspace to monitor above", hl.dsp.workspace.move({ monitor = "u" }))
o.bind("SUPER + SHIFT + ALT + DOWN", "Move workspace to monitor below", hl.dsp.workspace.move({ monitor = "d" }))

-- Pop window.
o.bind("SUPER + I", "Pop window out (float and pin)", "archbrigade-cmd-window-pop")
