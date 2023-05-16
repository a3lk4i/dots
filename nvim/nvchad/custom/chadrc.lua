---@type ChadrcConfig 
local M = {}
M.ui = {
  theme = "catppuccin",
  theme_toggle = {"catppuccin", "blossom_light"},

  statusline = {
    overriden_modules = function ()
      local r,c = unpack(vim.api.nvim_win_get_cursor(0))
      local st_modules = require "nvchad_ui.statusline.default"

      return {
        cursor_position = function ()
          return st_modules.cursor_position() .. r .. "|" .. c .. " "
        end
      }
    end
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
M.icons = require "custom.icons"
return M
