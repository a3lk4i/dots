local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- go
lspconfig.golangci_lint_ls.setup{on_attach = on_attach, capabilities = capabilities}
lspconfig.gopls.setup{
  gopls = function(_, opts)
    on_attach(
      function(client, _)
        if client.name == "gopls" then
          -- workaround for gopls not supporting semanticTokensProvider
          -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
          if not client.server_capabilities.semanticTokensProvider then
            local semanticTokens = client.config.capabilities.textDocument.semanticTokens
            client.server_capabilities.semanticTokensProvider = {
              full = true,
              legend = {
                tokenTypes = semanticTokens.tokenTypes,
                tokenModifiers = semanticTokens.tokenModifiers,
              },
              range = true,
            }
          end
        end
      end
    )
    opts.settings = {
      gopls = {
        gofumpt = true,
        codelenses = {
          gc_details = false,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        analyses = {
          fieldalignment = true,
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true,
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        semanticTokens = true,
      },
    }
  end,
}

-- proto
lspconfig.bufls.setup{on_attach = on_attach, capabilities = capabilities}

-- python
lspconfig.pylsp.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        autopep8 = {
          enabled = false,
        },
      },
    },
  },
}

-- misc
lspconfig.rome.setup{on_attach = on_attach, capabilities = capabilities}

