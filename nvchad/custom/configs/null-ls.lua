local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- Lua
  b.formatting.stylua,

  -- Proto
  b.diagnostics.buf,
  b.formatting.buf,

  -- Go
  b.formatting.gofumpt,
  b.formatting.goimports,
  b.code_actions.gomodifytags,

}

null_ls.setup {
  debug = true,
  sources = sources,
}
