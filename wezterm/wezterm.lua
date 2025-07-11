local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
	local _, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():set_position(0, -5)

	local bottomLeft = pane:split({ direction = "Bottom", size = 0.25 })
	-- bottomLeft:split({ direction = "Right", size = 0.5 })
	pane:activate()
end)

local config = wezterm.config_builder()

config.window_decorations = "RESIZE"
config.color_scheme = "OneHalfDark"
config.font = wezterm.font("Hack Nerd Font")
config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe" }
-- config.default_domain = 'WSL:Ubuntu-24.04'

config.initial_rows = 55
config.initial_cols = 140

config.keys = {
	{
		key = "+",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

return config
