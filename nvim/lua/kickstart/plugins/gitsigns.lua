-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
--
-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]h", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]h", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, { desc = "Jump to next git [h]unk" })

                map("n", "[h", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[h", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, { desc = "Jump to previous git [h]unk" })

                -- Actions
                -- visual mode
                map("v", "<leader>ghs", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "[s]tage hunk" })
                map("v", "<leader>ghr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "[r]eset hunk" })
                -- normal mode
                map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "[s]tage hunk" })
                map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "[r]eset hunk" })
                map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "[S]tage buffer" })
                map("n", "<leader>ghu", gitsigns.undo_stage_hunk, { desc = "[u]ndo stage hunk" })
                map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "[R]eset buffer" })
                map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "[p]review hunk" })
                map("n", "<leader>ghb", gitsigns.blame_line, { desc = "[b]lame line" })
                map("n", "<leader>ghd", gitsigns.diffthis, { desc = "[d]iff against index" })
                map("n", "<leader>ghD", function()
                    gitsigns.diffthis("@")
                end, { desc = "[D]iff against last commit" })
                -- Toggles
                map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
                map("n", "<leader>tD", gitsigns.toggle_deleted, { desc = "[T]oggle git show [D]eleted" })
            end,
        },
    },
}
