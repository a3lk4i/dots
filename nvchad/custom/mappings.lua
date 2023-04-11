---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>tt"] = {
			function()
				require("base46").toggle_theme()
			end,
			"toggle theme",
		},
		["<leader>tv"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"toggle vertical term",
		},
		["<leader>tf"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"toggle floating term",
		},
	},
}

-- more keybinds!

return M
