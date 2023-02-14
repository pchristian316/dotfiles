vim.g.mapleader = ' '

-- f: file tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<cr>')
-- y: telescope
vim.keymap.set('n', '<C-p>', function() require 'telescope.builtin'.find_files {} end)
vim.keymap.set('n', '<leader>ht', ':Telescope colorscheme<CR>')

-- w: window
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })
-- window resize
vim.keymap.set('n', '<C-Left>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize -3<CR>')
vim.keymap.set('n', '<C-Up>', ':resize +3<CR>')
vim.keymap.set('n', '<C-Down>', ': resize -3<CR>')
-- b: buffer
vim.keymap.set('n', '<leader>bn', ':bn<cr>')
vim.keymap.set('n', '<leader>bp', ':bp<cr>')
vim.keymap.set('n', '<leader>bd', ':Bdelete<cr>')
-- p: plugins
vim.keymap.set('n', '<leader>pi', ':PackerInstall<cr>')
vim.keymap.set('n', '<leader>pc', ':PackerClean<cr>')
-- definitions, references, linter.
vim.keymap.set('n', '<leader>le', ':Lspsaga show_line_diagnostics<cr>')
vim.keymap.set('n', '<leader>lE', ':Lspsaga show_cursor_diagnostics<cr>')
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>ld', ':Lspsaga preview_definition<cr>')
vim.keymap.set('n', '<leader>lr', ':Lspsaga rename<cr>')
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting)
vim.keymap.set('n', '<leader>lb', ':SymbolsOutline<cr>')
vim.keymap.set('n', '<leader>la', ':Lspsaga code_action<cr>')
vim.keymap.set('n', '<leader>lu', ':Lspsaga lsp_finder<cr>')
vim.keymap.set('n', '<F12>', ':Lspsaga code_action<cr>')
vim.keymap.set('n', '<leader>it', function() require('rust-tools.inlay_hints').toggle_inlay_hints() end)
vim.keymap.set('n', '<leader>is', function() require('rust-tools.inlay_hints').set_inlay_hints() end)
vim.keymap.set('n', '<leader>id', function() require('rust-tools.inlay_hints').diable_inlay_hints() end)
vim.keymap.set('n', '<f4>', ':SymbolsOutline<cr>')

vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration)
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>gp', ':Lspsaga diagnostic_jump_prev<cr>')
vim.keymap.set('n', '<leader>gn', ':Lspsaga diagnostic_jump_next<cr>')
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references)
-- h: git
vim.keymap.set('n', '<leader>hu', ':Gitsigns undo_stage_hunk<cr>')
vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<cr>')
vim.keymap.set('n', '<leader>hc', ':Gitsigns preview_hunk<cr>')
vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<cr>')
vim.keymap.set('n', '<leader>hR', ':Gitsigns reset_buffer')
vim.keymap.set('n', '<leader>hb', ':Gitsigns blame_line<cr>')
vim.keymap.set('n', '<leader>hd', ':Gitsigns diffthis<cr>')
vim.keymap.set('n', '<leader>hs', ':<C-U>Gitsigns select_hunk<CR>')
--toggle two splist from vert to horiz or vice versa; tv = turn vert, th = turn horiz
vim.keymap.set('n', '<Leader>tv', '<C-w>t<C-w>H')
vim.keymap.set('n', '<Leader>th', '<C-w>t<C-w>K')

-- easy splits
vim.keymap.set('n', '<Leader>s', ':sp<CR>')
vim.keymap.set('n', '<Leader>vs', ':vs<CR>')

-- tagbar
vim.keymap.set('n', '<F8>', ':Tagbar<CR>')

-- remap ; to :
vim.keymap.set('n', ';', ':', { noremap = true })

-- easier folds cause zA SUCKS AS A KEYBINDS
vim.keymap.set('n', '<Tab>', 'zA')
