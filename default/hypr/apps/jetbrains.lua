-- Fixing popup size issue.
o.window({ class = "(.*jetbrains.*)$", title = "^$" }, { float = true })
o.window({ class = "(.*jetbrains.*)$", title = "^$" }, { size = { "50%", "50%" } })
