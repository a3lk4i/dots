return {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
  },
  format_on_save = {
    lsp_format = "fallback",
    timeout_ms = 500,
  },
}
