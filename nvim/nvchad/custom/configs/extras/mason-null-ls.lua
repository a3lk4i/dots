---@type NvPluginSpec
local spec = {
 {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("custom.configs.null-ls")
    end,
    setup = {
      automatic_setup = true,
      ensure_installed = { "gomodifytags", "gofumpt", "iferr", "impl" }
    }
  }
}

return spec
