vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.conceallevel = 3
vim.g.undotree_WindowLayout = 3

-- flash on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
    vim.opt_local.buflisted = false
  end,
})
