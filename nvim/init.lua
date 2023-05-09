vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.conceallevel = 3
vim.g.undotree_WindowLayout = 3

-- flash on yank
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]
