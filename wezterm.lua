-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- ENV before shell
local home_path = os.getenv("HOME") or "/home/a3lk4i"
config.set_environment_variables = {
    XDG_CONFIG_HOME = home_path .. "/.config",
}

-- UI stuff
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_max_width = 30
config.colors = {
    tab_bar = {
        active_tab = {
            bg_color = "#292522",
            fg_color = "#e0e0e0",
            intensity = "Bold",
        },
    },
}

local custom_color_scheme = wezterm.color.get_builtin_schemes()["Gruvbox Material (Gogh)"]
custom_color_scheme.background = "#292522"
config.color_schemes = {
    ["custom"] = custom_color_scheme,
}
config.color_scheme = "custom"

config.font_size = 11
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
