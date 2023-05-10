local M = {}

M.ensure_installed = {
  -- go
  "gomodifytags",
  "goimports-reviser",
  "gofumpt",
  "iferr",
  "impl",
  -- proto
  "buf",
  -- python
  "ruff",
  "yapf",
  -- misc
  "actionlint",
  "cfn-lint",
  "html-lsp",
  "shellcheck",
  "yq",
}

M.ensure_installed_lsp = {
  -- go
  "gopls",
  "golangci_lint_ls",
  -- proto
  "bufls",
  -- python
  "pylsp",
  --misc
  "rome"
}

return M
