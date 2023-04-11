local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "markdown",
    "markdown_inline",

    "go",
    "proto",
    "python"
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- proto
    "buf",
    "buf-language-server",

    --- go
    "gopls",
    "go-debug-adapter",
    "gofumpt",
    "goimports",
    "golines",
    "gomodifytags",
    "gotests",
    "impl",
    "revive",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
