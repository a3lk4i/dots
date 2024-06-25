-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.set_environment_variables = {
  XDG_CONFIG_HOME = "/Users/akavuri/.config"
}
config.color_scheme = "Gruvbox Dark (Gogh)"
config.font_size = 18

-- and finally, return the configuration to wezterm
return config
