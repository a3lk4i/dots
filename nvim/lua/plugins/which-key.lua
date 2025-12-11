return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  lazy = false,
  cmd = "WhichKey",
  keys = {},
  opts = function()
    dofile(vim.g.base46_cache .. "whichkey")

    return {
      preset = "helix",
      delay = 200,
      -- Document existing key chains
      spec = {
        { "<leader>s", group = "[s]earch" },

        { "<leader>g", group = "[g]it" },
        { "<leader>gh", group = "[h]unk" },
        { "<leader>gt", group = "[t]oggle" },
      },
    }
  end,
}
