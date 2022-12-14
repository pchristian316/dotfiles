-- basics
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.opt.number          = true
vim.opt.relativenumber  = true
vim.opt.termguicolors   = true
vim.opt.shiftround      = true
vim.opt.updatetime      = 100
vim.opt.cursorline      = true
vim.opt.autowrite       = true
if (vim.fn.has('termguicolors') == 1) then
    vim.opt.termguicolors = true
end
-- tabs
vim.opt.autoindent  = true
vim.opt.tabstop     = 2 vim.opt.shiftwidth  = 2 vim.opt.softtabstop = 2
vim.opt.expandtab   = true
vim.opt.smarttab    = true
vim.opt.cindent     = true

-- undo and backup options
vim.opt.backup      = false
vim.opt.writebackup = false
vim.opt.undofile    = true
vim.opt.swapfile    = false

-- editing experience
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = num_au,
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 180})
  end,
})
vim.g.beacon_minimal_jump = 2
vim.g.transparent_enabled = 1
vim.o.scrolloff = 4

-- smarter autocompletion
vim.opt.ignorecase = true
vim.opt.infercase = true

require("core.keymaps")
--require("core.dvorak")	-- delete this line if you don't like using DVORAK
require("core.plugins")
require("core.gui")
-- disable some useless standard plugins to save startup time
-- these features have been better covered by plugins
vim.g.loaded_matchparen        = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_shada_plugin      = 1
vim.g.loaded_spellfile_plugin  = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins    = 1
require("core.theme")

require('image').setup {
  min_padding = 5,
  show_label = true,
  render_using_dither = true,
}

require('matchparen').setup({
  on_startup = true,
  hl_group = 'MatchParen',
  augroup_name = 'matchparen',
})

require'shade'.setup({
  overlay_opacity = 60,
})

-- Load plugin configs
-- plugins without extra configs are configured directly here
require("impatient")

require("configs.startscreen").config()
require("configs.autocomplete").config()
require("configs.symbols_outline").config()
require("configs.statusline").config()
require("configs.filetree").config()
require("configs.treesitter").config()
require("configs.git").config()
require("configs.bufferline").config()
require("configs.grammar").config()
require("configs.terminal").config()
require("configs.neorg").config()
