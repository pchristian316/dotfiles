return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

	{
		"nvim-tree/nvim-tree.lua",
		opts = { filters = {
			dotfiles = true,
		},
			view = {
				side = "left",
				signcolumn = "no",
			}
		},
		lazy = false,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"c", "cpp","lua",
			}
		}
	},
	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				-- add any options here
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					hover = {
						enabled = false
					},
					signature = {
						enabled = false
					}
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,

		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},

		lazy = false
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				-- stages = 'fade',
				background_colour = 'FloatShadow',
				timeout = 250,
			})
		end,
	},
	{
		"andweeb/presence.nvim",
		config = function()
			require("presence").setup({
		})end,
		lazy = false
	},
	{
		"junegunn/vim-slash",
		lazy = false
	},
	{
		"tpope/vim-surround",
		lazy = false
	},
	{
		"tpope/vim-repeat",
		lazy = false
	},
	{
		"mbbill/undotree",
		lazy = false,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
		lazy = false,
	},
	{
		"chrisgrieser/nvim-origami",
		event = "VeryLazy",
		config = function()
			require("origami").setup({
				-- keepFoldsAcrossSessions = true,
				pauseFoldsOnSearch = true,
				foldKeymaps = {
					setup = true,
					hOnlyOpensOnFirstColumn = false,
				},
			})
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {'NvimTreeNormal', 'NvimTreeNormalNC', 'FoldColumn', 'Folded'},
				exclude_groups = { -- table: default groups
					'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
					'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
					'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
					'SignColumn', 'CursorLineNr', 'EndOfBuffer', 'CursorLine'},
			})
		end,
		lazy = false,
	},
	{
		"NvChad/nvterm",
		config = function ()
			require("nvterm").setup({
				terminals = {
					shell = "/usr/bin/zsh",
				},
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
}
