return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    local servers = { "gopls", "basedpyright", "jsonls", "yamlls" }
    vim.lsp.enable(servers)

    vim.lsp.config("gopls", {
      settings = {
        gopls = {
          staticcheck = true,
          gofumpt = true,
          semanticTokens = true,
        },
      },
    })

    vim.lsp.config("basedpyright", {
      settings = {
        basedpyright = {},
      },
    })

    vim.lsp.config("jsonls", {
      settings = {
        format = { enabled = true },
        validate = { enabled = true },
        schemas = {
          ["https://opencode.ai/config.json"] = "*opencode.jsonc",
        },
      },
    })

    vim.lsp.config("yamlls", {
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
      settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = {
          schemaStore = {
            enable = true,
            url = "https://www.schemastore.org/api/json/catalog.json",
          },
          format = { enabled = false },
          validate = false,
          schemas = {
            kubernetes = "*.yaml",
            ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
            ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
            ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
            ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*workflow*.{yml,yaml}",
            ["https://s3.amazonaws.com/cfn-resource-specifications-us-east-1-prod/schemas/2.15.0/all-spec.json"] = "*aws*.{yml,yaml}",
          },
        },
      },
    })
  end,
}
