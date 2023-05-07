local M = {}

M.ensure_installed = {
  -- go
  "gopls",
  "golangci-lint-langserver",
  "gomodifytags",
  "goimports-reviser",
  "gofumpt",
  "iferr",
  "impl",
  -- proto
  "buf",
  "buf-language-server",
  -- misc
  "actionlint",
  "cfn-lint",
  "html-lsp",
  "rome",
  "shellcheck",
  "yq",
}

return M
