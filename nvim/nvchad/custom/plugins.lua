local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    opts = require("custom.configs.nvimtree"),
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = require("custom.configs.treesitter").ensure_installed
    }
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = require("custom.configs.mason").ensure_installed
    },
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = true,
  },

  { import = "custom.configs.nvim-dap", },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = require("custom.configs.gitsigns").opts
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = require("custom.configs.which-key").opts
  },

  { import = "custom.configs.nvim-spectre", },
  { import = "custom.configs.trouble", },
  { import = "custom.configs.todo-comments", },
  { import = "custom.configs.go.plugins", },
  { import = "custom.configs.markdown.plugins", }
}
return plugins
