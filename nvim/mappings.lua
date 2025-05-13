require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map({"n", "v"}, ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map({"n", "v"}, ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fs", ":e $MYVIMRC | :cd %:p:h | :e lua/custom/init.lua | :bd init.lua | :NvimTreeToggle <CR>", { desc = "open settings" })
map("n", "<leader>fn", ":Neorg index<CR>")
map("n", "<leader>u", ":UndotreeToggle<CR>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-Up>", ":resize +3<CR>")
map("n", "<C-Down>", ":resize -3<CR>")
map("n", "<C-Left>", ":vertical resize +3<CR>")
map("n", "<C-Right>", ":vertical resize -3<CR>")
map("n", "<leader> ", "i <ESC>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
