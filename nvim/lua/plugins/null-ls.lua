return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.prettierd,
          -- aws cfn
          nls.builtins.diagnostics.cfn_lint,
          -- proto | buf.build
          nls.builtins.diagnostics.buf,
          nls.builtins.formatting.buf,
          -- lua
          nls.builtins.formatting.stylua,
          -- shell
          nls.builtins.formatting.shfmt,
        },
      }
    end,
  },
}
