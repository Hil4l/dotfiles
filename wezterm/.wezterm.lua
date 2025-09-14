local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ==========================
-- Layout
-- ==========================

-- initial window geometry
config.initial_cols = 120
config.initial_rows = 28

config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 0,
	right = 0,
	bottom = 0
}

-- ==========================
-- Appearance
-- ==========================

config.font_size = 12

config.colors = {
	cursor_bg = 'white',
}

-- config.color_scheme = 'rose-pine-moon'
config.color_scheme = 'Batman'
-- config.window_decorations = "RESIZE"

-- ==========================
-- keymaps
-- ==========================
config.keys = {
    { key = 'q', mods = 'CTRL', action = wezterm.action.QuitApplication },
}

-- ==========================
-- Shell
-- ==========================
config.default_domain = 'WSL:Ubuntu'

return config

