return {
  { -- Highlight todo, notes, etc in comments
    "folke/todo-comments.nvim",
    event = "User FilePost",
    opts = { signs = false },
    keys = {
      { "<leader>st", "<Cmd>TodoTelescope<CR>", { desc = "search [T]ODOs" } },
    },
  },
  { "numToStr/Comment.nvim", opts = {} },
}
