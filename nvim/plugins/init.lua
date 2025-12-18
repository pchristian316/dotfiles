return {
	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "configs.lspconfig"
		end, },

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
		"chrisgrieser/nvim-origami",
		event = "VeryLazy",
		config = function()
			require("origami").setup({
				-- keepFoldsAcrossSessions = true,
				pauseFoldsOnSearch = true,
				autoFold = {
					enabled = false,
				},
				foldKeymaps = {
					setup = true,
					hOnlyOpensOnFirstColumn = false,
				}
			})
		end,
	},
	{
		"romainl/vim-cool",
		lazy = false,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		lazy = false,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
	},
	-- {
	-- 	"nvim-neorg/neorg",
	-- 	lazy = false,
	-- 	version = "*",
	-- 	config = function()
	-- 		require("neorg").setup {
	-- 			load = {
	-- 				["core.defaults"] = {},
	-- 				["core.concealer"] = {},
	-- 				["core.dirman"] = {
	-- 					config = {
	-- 						workspaces = {
	-- 							notes = "~/notes",
	-- 						},
	-- 						default_workspace = "notes",
	-- 					},
	-- 				},
	-- 			},
	-- 		}
	-- 	end,
	-- },
	{
		"vimwiki/vimwiki",
		event = "BufEnter *.md",
		keys = {"<leader>ww", "<leader>wt"},
		init = function()
			vim.g.vimwiki_list = {
				{
					syntax = "markdown",
					ext = "md",
				},
			}
			vim.g.vimwiki_global_ext = 0;
			vim.treesitter.language.register('markdown', 'vimwiki')
		end,
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		lazy = false,
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			file_types = { 'markdown', 'vimwiki'},
			heading = {
				-- icons = { '✸ ', '✦ ', '✧ ', '◆ ', '◇ ', '• ' },
				-- icons = { ' ', ' ', ' ', ' ', ' ', ' ' },
				-- icons = { '✱ ', '✲ ', '✳ ', '✴ ', '❇ ', '❈ ' },
				-- icons = { '✱ ', '✲ ', '✳ ', '✶ ', '✷ ', '✴ ' },
				-- icons = { '✦ ', '✧ ', '✩ ', '✪ ', '✫ ', '✬ ' },
				icons = { '✶ ', '✷ ', '✹ ', '✺ ', '✵ ', '✴ '},
				width = 'full',
			},
		},
	},
}
