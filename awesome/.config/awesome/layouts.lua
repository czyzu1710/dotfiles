awful = require("awful")
-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts = {
    awful.layout.suit.spiral,
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}
return layouts
