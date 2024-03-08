return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "buf",
        "buf-language-server",
        "cfn-lint",
        "prettierd",
        "ruff",
        "shfmt",
        "stylua",
        "yamllint",
      },
    },
  },
}
