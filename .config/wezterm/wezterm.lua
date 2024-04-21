-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

return {
	color_scheme = "Catppuccin Mocha",
	line_height = 1.2,
	underline_position = -8,
	underline_thickness = 0.1,
	hide_tab_bar_if_only_one_tab = true,
	disable_default_key_bindings = true,
	keys = {
		{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
		{ key = "=", mods = "SUPER", action = act.IncreaseFontSize },
		{ key = "-", mods = "SUPER", action = act.DecreaseFontSize },
	},
	window_padding = {
		left = 20,
		right = 20,
		top = 0,
		bottom = 0,
	},
	font = wezterm.font("RecMonoDuotone Nerd Font", { stretch = "Expanded", weight = "Medium", italic = false }),
	font_size = 14,
	font_rules = {
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font("RecMonoCasual Nerd Font", {
				-- override
				weight = "Medium",
				italic = false,
			}),
		},
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font("RecMonoCasual Nerd Font", {
				weight = "Bold",
				italic = false,
			}),
		},
	},
}
