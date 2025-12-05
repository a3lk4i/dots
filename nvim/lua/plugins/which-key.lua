return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  lazy = false,
  cmd = "WhichKey",
  keys = {},
  opts = function()
    dofile(vim.g.base46_cache .. "whichkey")

    return {
      delay = 200,
      -- Document existing key chains
      spec = {
        { "<leader>s", group = "[S]earch" },
        { "<leader>t", group = "[T]oggle" },
        { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
      },
    }
  end,
}
