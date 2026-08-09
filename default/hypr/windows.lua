-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Just a dash of opacity by default.
o.window(".*", { opacity = "0.97 0.9" })

-- App-specific tweaks.
require("default.hypr.apps")
