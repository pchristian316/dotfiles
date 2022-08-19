
-- Config was built using the following config:
-- https://github.com/numToStr/dotfiles/tree/master/neovim/.config/nvim/
local g   = vim.g
local o   = vim.o
local opt = vim.opt
local A   = vim.api

-- cmd('syntax on')
-- vim.api.nvim_command('filetype plugin indent on')

o.termguicolors = true
-- o.background = 'dark'

-- Do not save when switching buffers
-- o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
vim.cmd [[set colorcolumn=81]]
vim.cmd [[set foldmethod=indent]]

-- Better editing experience
o.expandtab = true
o.smarttab = true o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
-- o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
-- BUG This option causes an error!
-- o.jumpoptions = 'view'

-- BUG: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- o.lazyredraw = true

-- Better folds (don't fold by default)
-- o.foldmethod = 'indent'
-- o.foldlevelstart = 99
-- o.foldnestmax = 3
-- o.foldminlines = 1
--
opt.mouse = "a"

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '


require('lualine').setup()
g.seoul256_background = 233

-- COLORSCHEMES
-- Uncomment just ONE of the following colorschemes!
local ok, _ = pcall(vim.cmd, 'colorscheme base16-seti')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-ayu-dark')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-dracula')
-- local ok, _ = pcall(vim.cmd, 'colorscheme seoul256')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-gruvbox-dark-medium')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-monokai')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-nord')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-oceanicnext')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-onedark')
-- local ok, _ = pcall(vim.cmd, 'colorscheme palenight')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-solarized-dark')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-solarized-light')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-tomorrow-night')


-- Highlight the region on yank
A.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

-- KEYBINDINGS
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

local function nnoremap(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true })
end

-- nerdtree
map('n', '<C-n>', ':NERDTreeToggle<CR>')
g.NERDTreeDirArrowExpandable = '►'
g.NERDTreeDirArrowCollapsible = '▼'
g.NERDTreeShowLineNumbers=1
g.NERDTreeShowHidden=1
g.NERDTreeMinimalUI = 1
g.NERDTreeWinSize=38

-- vim rainbow
g.rainbow_active=1

-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Make adjusting split sizes easier
nnoremap("n", "<C-h>", "<C-w>h")
nnoremap("n", "<C-j>", "<C-w>j")
nnoremap("n", "<C-k>", "<C-w>k")
nnoremap("n", "<C-l>", "<C-w>l")

-- Make adjusting split sizes a bit more friendly

map('n', "<C-Left>", ":vertical resize +3<CR>")
map('n', "<C-Right>", ":vertical resize -3<CR>")
map('n', "<C-Up>", ":resize +3<CR>")
map('n', "<C-Down>", ":resize -3<CR>")

-- toggle two splits from vert to horiz or horiz to vert
map('n', '<Leader>tv', '<C-w>t<C-w>H')
map('n', '<Leader>th', '<C-w>t<C-w>K')

-- PLUGINS
-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- A better status line
  use {
    'nvim-luaine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- File management --
  use 'scrooloose/nerdtree'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'ryanoasis/vim-devicons'

  -- Tim Pope Plugins --
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

  -- Syntax Highlighting and Colors --
  use 'PotatoesMaster/i3-vim-syntax'
  use 'ap/vim-css-color'
  use 'sheerun/vim-polyglot'
  use 'dense-analysis/ale'
  use 'jelera/vim-javascript-syntax'

  -- Junegunn Choi Plugins --
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  use 'junegunn/vim-emoji'
  use 'junegunn/seoul256.vim'

  -- Colorschemes
  use 'RRethy/nvim-base16'
  use 'kyazdani42/nvim-palenight.lua'

  -- Other stuff
  use 'luochen1990/rainbow'
  use 'tmsvg/pear-tree'
  use {'neoclide/coc.nvim', branch = 'release'}
end)
