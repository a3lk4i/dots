local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    -- buf start
    "proto",
    -- buf end
    -- go start
    "go",
    "gomod",
    "gosum",
    "gowork",
    -- go end
    --
    -- misc start
    "bash",
    "dockerfile",
    "gitignore",
    "json",
    "latex",
    "lua",
    "html",
    "make",
    "markdown",
    "markdown_inline",
    "regex",
    "sql",
    "toml",
    "yaml",
    -- misc end
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- buf.build for protocol buffers
    "buf",
    "buf-language-server",
    -- buf.build end

    -- go start
    "gopls",
    "golangci-lint-langserver",
    "gomodifytags",
    "gofumpt",
    "iferr",
    "impl",
    "goimports-reviser",
    -- go end

    -- lua start
    "lua-language-server",
    "stylua",
    -- lua end

    -- misc start
    "actionlint",
    "cfn-lint",
    "html-lsp",
    "rome",
    "shellcheck",
    "yq",
    -- misc end
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
