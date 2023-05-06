local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- misc
  b.formatting.rome.with { filetypes = { "html", "json", "markdown" } },
  b.diagnostics.actionlint,
  b.diagnostics.cfn_lint,

  -- Lua
  b.formatting.stylua,

  -- buf.build for protocol buffers
  b.diagnostics.buf,
  b.formatting.buf,

  -- shell
  b.diagnostics.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
