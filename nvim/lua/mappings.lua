local map = vim.keymap.set

map({ "n", "i" }, "<C-s>", "<Esc><cmd> w <CR>")
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "split vertical" })
map("n", "<leader>_", "<cmd>split<CR>", { desc = "split horizontal" })

-- from prime
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "[y]ank to system clipboard" })
map({ "n", "v" }, "<leader>d", '"_d')

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")

map(
  "n",
  "<leader>S",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "[S]earch & replace" }
)

-- Plugins

-- Nvim-Tree
map("n", "\\", "<cmd> NvimTreeToggle <CR>")
-- Telescope
map("n", "<leader>sb", "<cmd> Telescope buffers <CR>", { desc = "[b]uffers" })
map("n", "<leader>sd", "<cmd> Telescope diagnostics <CR>", { desc = "[d]iagnostics" })
map("n", "<leader>sf", "<cmd> Telescope find_files <CR>", { desc = "[f]iles" })
map("n", "<leader>sg", "<cmd> Telescope live_grep <CR>", { desc = "[g]rep" })
map("n", "<leader>sr", "<cmd> Telescope resume <CR>", { desc = "[r]esume" })
map("n", "<leader>st", "<cmd> TodoTelescope <CR>", { desc = "[t]oDos" })
map("n", "<leader>sq", vim.diagnostic.setloclist, { desc = "[Q]uickfix list" })
-- Gitsigns
map("n", "<leader>ghs", "<cmd> Gitsigns stage_hunk <CR>", { desc = "[s]tage" })
map("n", "<leader>ghr", "<cmd> Gitsigns reset_hunk <CR>", { desc = "[r]eset" })
map("n", "<leader>ghp", "<cmd> Gitsigns preview_hunk <CR>", { desc = "[p]review" })
map("n", "<leader>ghp", "<cmd> Gitsigns preview_hunk <CR>", { desc = "[p]review" })
map("n", "<leader>gb", "<cmd> Gitsigns blame_line <CR>", { desc = "[b]lame line" })
map("n", "<leader>gtb", "<cmd> Gitsigns toggle_current_line_blame <CR>", { desc = "[b]lame" })
map("n", "<leader>gtd", "<cmd> Gitsigns toggle_deleted <CR>", { desc = "[d]eleted" })
map("n", "<leader>gtl", "<cmd> Gitsigns toggle_linehl <CR>", { desc = "[l]inehl" })
map("n", "]h", "<cmd> Gitsigns next_hunk <CR>", { desc = "next hunk" })
map("n", "[h", "<cmd> Gitsigns prev_hunk <CR>", { desc = "previous hunk" })
