return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "buf",
        "buf-language-server",
        "cfn-lint",
        "prettierd",
        "rome",
        "ruff",
        "shfmt",
        "stylua",
        "yamllint",
      },
    },
  },
}
