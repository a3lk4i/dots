return { -- Autoformat
  "stevearc/conform.nvim",
  lazy = false,
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      proto = { "buf" },
      python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
      yaml = { "yamlfmt" },
      toml = { "tombi" },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
