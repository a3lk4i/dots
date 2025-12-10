-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- ENV before shell
local home_path = os.getenv("HOME") or "/home/a3l"
config.set_environment_variables = {
  XDG_CONFIG_HOME = home_path .. "/.config",
}

local is_linux = function()
  return wezterm.target_triple:find("linux") ~= nil
end

config.default_prog = is_linux() and { "/home/linuxbrew/.linuxbrew/bin/nu" }
  or { "/opt/homebrew/bin/nu" }

-- UI stuff
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_max_width = 30

config.color_scheme_dirs = { home_path .. "/.config/wezterm/colors" }

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return "Dark"
end

local function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "melange_dark"
  else
    return "melange_light"
  end
end
config.color_scheme = scheme_for_appearance(get_appearance())

config.font_size = is_linux() and 13 or 16
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- Keybindings
config.keys = {}
for i = 1, 8 do
  -- CTRL + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = "CTRL",
    action = act.ActivateTab(i - 1),
  })
  -- F1 through F8 to activate that tab
  table.insert(config.keys, {
    key = "F" .. tostring(i),
    action = act.ActivateTab(i - 1),
  })
end
table.insert(config.keys, {
  key = "t",
  mods = "CTRL",
  action = act.SpawnTab("CurrentPaneDomain"),
})
table.insert(config.keys, {
  key = "w",
  mods = "CTRL",
  action = wezterm.action.CloseCurrentTab({ confirm = true }),
})

-- and finally, return the configuration to wezterm
return config
