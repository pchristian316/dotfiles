-- packer.nvim
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- starup time optimise
	use 'dstein64/vim-startuptime'
	use 'lewis6991/impatient.nvim'
	use 'nathom/filetype.nvim'

	-- buffer
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	}
	use 'moll/vim-bbye' -- for more sensible delete buffer cmd

	-- themes (disabled other themes to optimize startup time)
 use 'sainnhe/sonokai'
 use 'tiagovla/tokyodark.nvim'
 use 'projekt0n/github-nvim-theme'
 use 'joshdick/onedark.vim'
 use { 'catppuccin/nvim', as='catppuccin' }
 use { 'sonph/onehalf', rtp='vim/' }
 use 'ahmedabdulrahman/aylin.vim'
 use "rebelot/kanagawa.nvim"
 use 'NLKNguyen/papercolor-theme'
 use 'liuchengxu/space-vim-dark'
 use 'sainnhe/edge'
 use 'B4mbus/oxocarbon-lua.nvim'
 use 'Th3Whit3Wolf/one-nvim'
 use 'RRethy/nvim-base16'

	-- file tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}

	-- language
	use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
	use 'glepnir/lspsaga.nvim'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
	use 'nvim-treesitter/nvim-treesitter'
	use 'simrat39/rust-tools.nvim'
	use 'simrat39/symbols-outline.nvim'
	use 'PotatoesMaster/i3-vim-syntax'
	use 'ap/vim-css-color'
  use 'sbdchd/neoformat'

	-- git
	use {
		'lewis6991/gitsigns.nvim',
		tag = 'release',
	}

	-- status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	}

	-- floating terminal
	use 'akinsho/toggleterm.nvim'

	-- file telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}

	-- indent guide
	use "lukas-reineke/indent-blankline.nvim"

	-- startup screen
  use "goolord/alpha-nvim"

	-- english grammar check
	use 'rhysd/vim-grammarous'

	-- ascii image
	use 'samodostal/image.nvim'

  -- tim pope plugins
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'

  -- rainbow for treesitter
  use 'p00f/nvim-ts-rainbow'

  -- parantheses pairing
  use 'tmsvg/pear-tree'

  -- discord rich presence
  use 'andweeb/presence.nvim'
  -- dracula theme
  use 'Mofiqul/dracula.nvim'

  -- matching parantheses
  use 'monkoose/matchparen.nvim'

  -- disabling highlighting after search
  use 'romainl/vim-cool'

  -- smooth scrolling
  use 'joeytwiddle/sexy_scroller.vim'

  -- highlight cursor when jumping
  use 'DanilaMihailov/beacon.nvim'

  -- shade different splits
  use 'sunjon/shade.nvim'

  -- minimap of code
  use 'preservim/tagbar'

  -- fancy
  use 'folke/twilight.nvim'


  -- org mode
  use {
    'nvim-neorg/neorg',
    run = ":Neorg sync-parsers",
    requires = 'nvim-lua/plenary.nvim'
}
end)
