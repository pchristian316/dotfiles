require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.relativenumber = true
o.wrap = true
o.linebreak = true
o.expandtab = false
o.cursorline = true
o.foldlevel = 99
o.foldlevelstart = 99
o.winborder = "rounded"

-- vim.o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
vim.opt.list = true
vim.opt.conceallevel = 2
vim.g.undotree_WindowLayout = 3
vim.o.guifont = "Iosevka Nerd Font:h20"

-- flash on yank
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]
