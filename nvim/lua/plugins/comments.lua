return {
  { -- Highlight todo, notes, etc in comments
    "folke/todo-comments.nvim",
    event = "User FilePost",
    opts = { signs = false },
  },
  { "numToStr/Comment.nvim", opts = {} },
}
