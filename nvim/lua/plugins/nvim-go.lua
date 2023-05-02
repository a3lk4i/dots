return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    event = "CmdlineEnter",
    ft = { "go", "gomod", "gosum", "gowork" },
  },
}
