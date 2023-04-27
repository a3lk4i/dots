return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = {
        gopls = {},
        jsonls = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      }
    end,
  },
}
