local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- go
  b.code_actions.gomodifytags,
  b.code_actions.impl,

  b.formatting.gofumpt,
  b.formatting.goimports_reviser,
  -- proto
  b.diagnostics.buf,
  b.formatting.buf,
  -- misc
  b.diagnostics.actionlint,
  b.diagnostics.cfn_lint,
  b.formatting.rome.with { filetypes = { "html", "json", "markdown" } },
  b.diagnostics.shellcheck,
  b.formatting.stylua,

}

null_ls.setup {
  debug = true,
  sources = sources,
}
