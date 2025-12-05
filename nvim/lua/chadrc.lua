-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "melange",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    " vim",
    "",
    "",
  },
  buttons = {
    { txt = "  Search Files", keys = "sf", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "s.", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Live grep", keys = "sg", cmd = "Telescope live_grep" },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
      content = "fit",
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

M.ui = {
  tabufline = {
    enabled = false,
  },
  telescope = { style = "bordered" },
}

return M
