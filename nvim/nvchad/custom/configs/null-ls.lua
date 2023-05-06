local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- misc start
  b.diagnostics.actionlint,
  b.diagnostics.cfn_lint,
  b.formatting.rome.with { filetypes = { "html", "json", "markdown" } },
  b.diagnostics.shellcheck,
  b.formatting.stylua,
  -- misc end

  -- go start
  b.code_actions.gomodifytags,
  b.code_actions.impl,

  b.formatting.gofumpt,
  b.formatting.goimports_reviser,
  -- go end

  -- proto | buf.build star
  b.diagnostics.buf,
  b.formatting.buf,
  -- proto | buf.build end
}

null_ls.setup {
  debug = true,
  sources = sources,
}
