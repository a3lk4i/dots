return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = {
        "bash",
        "html",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "proto",
        "python",
        "query",
        "regex",
        "vim",
        "vimdoc",
        "yaml",
      }
    end,
  },
}
