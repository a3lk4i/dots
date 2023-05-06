local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "bash",
    "dockerfile",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "json",
    "latex",
    "lua",
    "html",
    "make",
    "markdown",
    "markdown_inline",
    "proto",
    "regex",
    "sql",
    "toml",
    "yaml",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua 
    "lua-language-server",
    "stylua",

    -- misc
    "html-lsp",
    "rome",
    "actionlint",
    "cfn-lint",

    -- buf.build for protocol buffers
    "buf",
    "buf-language-server",

    -- shell
    "shellcheck",

    -- yaml
    "yq",
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
