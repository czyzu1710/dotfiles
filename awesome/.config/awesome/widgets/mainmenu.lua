-- This is used later as the default terminal and editor to run.
local awful = require('awful')
local beautiful = require('beautiful')
local hotkeys_popup = require("awful.hotkeys_popup")

local terminal = "kitty"
local editor = "nvim" or os.getenv("EDITOR") or "nano"
local editor_cmd = terminal .. " -e " .. editor

local myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

local mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })


return mymainmenu
