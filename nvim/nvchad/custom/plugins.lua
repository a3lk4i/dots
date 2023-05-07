local plugings = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = require("custom.configs.treesitter").ensure_installed
    }
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require("custom.configs.nvimtree"),
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = require("custom.configs.mason").ensure_installed
    }
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end
  },

  {
    "folke/trouble.nvim",
    cmd = {"Trouble", "TroubleToggle"},
    config = true, -- Todo: change when base46 has colors? for this
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = true,
  }
}
return plugings
