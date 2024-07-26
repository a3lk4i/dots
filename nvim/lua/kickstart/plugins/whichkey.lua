-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end
--
-- Useful plugin to show you pending keybinds.
return {
    {
        "folke/which-key.nvim",
        event = "VimEnter", -- Sets the loading event to 'VimEnter'
        config = function() -- This is the function that runs, AFTER loading
            require("which-key").setup()

            -- Document existing key chains
            require("which-key").add({
                { "<leader>c", group = "[c]ode" },
                { "<leader>c_", hidden = true },
                { "<leader>d", group = "[d]ocument" },
                { "<leader>d_", hidden = true },
                { "<leader>g", group = "[g]it" },
                { "<leader>g_", hidden = true },
                { "<leader>gh", group = "[h]unk" },
                { "<leader>gh_", hidden = true },
                { "<leader>r", group = "[r]ename" },
                { "<leader>r_", hidden = true },
                { "<leader>s", group = "[s]earch" },
                { "<leader>s_", hidden = true },
                { "<leader>t", group = "[t]oggle" },
                { "<leader>t_", hidden = true },
                { "<leader>w", group = "[w]orkspace" },
                { "<leader>w_", hidden = true },
            })
            -- visual mode
            require("which-key").add({
                { "<leader>g", desc = "[g]it", mode = "v" },
                { "<leader>gh", desc = "[h]unk", mode = "v" },
            })
        end,
    },
}
