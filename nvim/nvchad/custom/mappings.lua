---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>sx"] = {
      function()
        require("telescope.builtin").resume()
      end,
      "resume telescope",
      opts = { noremap = true, silent = true }
    }
  },
}

-- more keybinds!

return M
