return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "nu",

      "vim",
      "vimdoc",

      "lua",
      "luadoc",

      "markdown",
      "markdown_inline",

      "diff",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",

      "go",
      "gomod",
      "gosum",
      "gowork",

      "python",
      "sql",
      "json",
      "yaml",
      "toml",
      "make",
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
