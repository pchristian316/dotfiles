vim.g.mapleader = ' '

-- f: file tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<cr>')
-- y: telescope
vim.keymap.set('n', '<C-p>', function() require 'telescope.builtin'.find_files {} end)
-- w: window
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })
-- window resize
vim.keymap.set('n', '<C-Left>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<C-Up>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<C-Down>', ':vertical resize +3<CR>')
-- b: buffer
vim.keymap.set('n', '<leader>bn', ':bn<cr>')
vim.keymap.set('n', '<leader>bp', ':bp<cr>')
vim.keymap.set('n', '<leader>bd', ':Bdelete<cr>')
-- p: plugins
vim.keymap.set('n', '<leader>pi', ':PackerInstall<cr>')
vim.keymap.set('n', '<leader>pc', ':PackerClean<cr>')
-- h: git
vim.keymap.set('n', '<leader>hu', ':Gitsigns undo_stage_hunk<cr>')
vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<cr>')
vim.keymap.set('n', '<leader>hc', ':Gitsigns preview_hunk<cr>')
vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<cr>')
vim.keymap.set('n', '<leader>hR', ':Gitsigns reset_buffer')
vim.keymap.set('n', '<leader>hb', ':Gitsigns blame_line<cr>')
vim.keymap.set('n', '<leader>hd', ':Gitsigns diffthis<cr>')
vim.keymap.set('n', '<leader>hs', ':<C-U>Gitsigns select_hunk<CR>')
-- source vimrc
vim.keymap.set('n', ',v', ':source $MYVIMRC<CR>', { noremap = true })
--toggle two splist from vert to horiz or vice versao
vim.keymap.set('n', '<Leader>tv', '<C-w>t<C-w>H')
vim.keymap.set('n', '<Leader>th', '<C-w>t<C-w>K')
