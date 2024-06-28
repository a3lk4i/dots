-- Collection of various small independent plugins/modules
return {
    {
        "echasnovski/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [']quote
            --  - ci'  - [C]hange [I]nside [']quote
            require("mini.ai").setup({ n_lines = 500 })

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require("mini.surround").setup()

            -- Comment helper
            require("mini.comment").setup()

            -- Interactive starter
            -- Set starter footer and refresh after `startuptime` is available
            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local starter = require("mini.starter")
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    starter.config.footer = function()
                        return "󰚥  Loaded plugins: "
                            .. stats.loaded
                            .. "/"
                            .. stats.count
                            .. "\n󱓞  Startup time: "
                            .. ms
                            .. " ms"
                    end
                    -- https://github.com/LazyVim/LazyVim/commit/dc66887b57ecdee8d33b5e07ca031288260e2971
                    vim.cmd([[do VimResized]])
                end,
            })
            local starter = require("mini.starter")
            starter.setup({
                items = {
                    starter.sections.recent_files(10, true),
                    { section = "Tools", name = "Lazy", action = "Lazy" },
                    starter.sections.builtin_actions(),
                },
            })
        end,
    },
}
