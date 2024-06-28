-- Highlight todo, notes, etc in comments
return {
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
        keys = {
            { "<leader>st", "<Cmd>TodoTelescope<CR>", { desc = "search [T]ODOs" } },
        },
    },
}
