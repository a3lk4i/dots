return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "cfn-lint",
        "prettierd",
        "shfmt",
        "stylua",
        "yamllint",
      },
    },
  },
}
