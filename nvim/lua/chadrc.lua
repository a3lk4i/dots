local M = {}

M.base46 = {
  theme = "melange",
}

M.ui = {
  statusline = { theme = "vscode_colored" },
  tabufline = { enabled = false },
  telescope = { style = "bordered" },
}

M.nvdash = { load_on_startup = true }

M.cheatsheet = {
  theme = "grid", -- simple/grid
  excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
}

return M
