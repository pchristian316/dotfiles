require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("i", "jk", "<ESC>")
map({"n", "v"}, ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fs", "<cmd>e $MYVIMRC | :cd %:p:h | :e lua/custom/init.lua | :bd init.lua | :NvimTreeToggle <CR>", { desc = "open settings" })
map("n", "<leader>fn", "<cmd>Neorg index<CR>")
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-Up>", "<cmd>resize +3<CR>")
map("n", "<C-Down>", "<cmd>resize -3<CR>")
map("n", "<C-Left>", "<cmd>vertical resize +3<CR>")
map("n", "<C-Right>", "<cmd>vertical resize -3<CR>")
-- map("t", "<C-h>", "<C-\\><C-n><C-w>h")
-- map("t", "<C-j>", "<C-\\><C-n><C-w>j")
-- map("t", "<C-k>", "<C-\\><C-n><C-w>k")
-- map("t", "<C-l>", "<C-\\><C-n><C-w>l")
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
map("n", "<leader> ", "i <ESC>")

map("v", "J", "<cmd>m '>+1<CR>gv=gv")
map("v", "K", "<cmd>m '<-2<CR>gv=gv")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
