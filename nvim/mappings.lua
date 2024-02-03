local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<Esc>"] = { ":noh <CR>", "clear highlights" }
  }
}

-- Your custom mappings
M.general = {
  n = {
    [";"] = {":"},
    ["<leader>fs"] = {":e $MYVIMRC | :cd %:p:h | :e lua/custom/init.lua | :bd init.lua | :NvimTreeToggle <CR>", "open settings"},
    ["<leader>u"] = {":UndotreeToggle<CR>", "open undotree"},
    ["<C-d>"] = {"<C-d>zz"},
    ["<C-u>"] = {"<C-u>zz"},
    ["n"] = {"nzzzv"},
    ["N"] = {"Nzzzv"},
    ["<C-Up>"] = {":resize +3<CR>"},
    ["<C-Down>"] = {":resize -3<CR>"},
    ["<C-Left>"] = {":vertical resize +3<CR>"},
    ["<C-Right>"] = {":vertical resize -3<CR>"},
    ["<leader>r"] = {":RunCode<CR>", "run code"},
		["<leader> "] = {"i <ESC>"},
  },
  v = {
    ["J"] = {":m '>+1<CR>gv=gv"},
    ["K"] = {":m '<-2<CR>gv=gv"},
    [";"] = {":"},
  },

  t = { -- terminal mode
    ["<C-h>"] = { "<C-\\><C-n><C-w>h"},
    ["<C-j>"] = { "<C-\\><C-n><C-w>j"},
    ["<C-k>"] = { "<C-\\><C-n><C-w>k"},
    ["<C-l>"] = { "<C-\\><C-n><C-w>l"},
  }

}

return M
