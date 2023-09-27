-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

-- and finally, return the configurat to wezterm
config.font = wezterm.font("FiraCode Nerd Font", {
	stretch = "Expanded",
	weight = "Regular",
})
config.line_height = 1.2
config.default_cursor_style = "BlinkingBlock"


-- config.font_size = 15
config.underline_position = -5
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.color_scheme = "Everblush (Gogh)"
return config
