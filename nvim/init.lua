vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.foldmethod= "manual"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.expandtab = false
-- vim.opt.fillchars:append('fold:•')
vim.o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
vim.opt.list = true
vim.opt.conceallevel = 3
vim.g.undotree_WindowLayout = 3


-- flash on yank
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]
