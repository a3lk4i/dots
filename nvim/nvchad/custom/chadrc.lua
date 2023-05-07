---@type ChadrcConfig 
 local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

 M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "blossom_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

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

return M
