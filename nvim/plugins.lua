local plugins = {
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
        -- background_colour = 'FloatShadow',
        timeout = 250,
      })
    end,
	},
	{
		"andweeb/presence.nvim",
		lazy = false
	},
	{
		"aduros/ai.vim",
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
		"numToStr/Comment.nvim",
		keys = { "gcc", "gbc" },
		init = function()
			require("core.utils").load_mappings "comment"
		end,
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
		lazy = false,
	},
	{
		'nvim-neorg/neorg',
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {
						config = {
							icon_preset = "varied"
						},
					},
					["core.integrations.nvim-cmp"] = {},
					["core.integrations.treesitter"] = {},
					["core.syntax"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								my_ws = "~/neorg"
							},
							index = "index.norg",
							default_workspace = "my_ws";
						},
					},
				}
			})
		end,
		build = ":Neorg sync-parsers",
		dependencies = 'nvim-lua/plenary.nvim',
		lazy = false,
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
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						relculright = true,
						segments = {
							{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
							{ text = { "%s" }, click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						},
					})
				end,
			},
	  },
		event = "BufReadPost", -- needed for folds to load properly
		keys = {
			{
				"zr",
				function() require("ufo").openFoldsExceptKinds { "comment" } end,
				desc = " 󱃄 Open All Folds except comments",
			},
			{ "zm", function() require("ufo").closeAllFolds() end, desc = " 󱃄 Close All Folds" },
			{ "z1", function() require("ufo").closeFoldsWith(1) end, desc = " 󱃄 Close L1 Folds" },
			{ "z2", function() require("ufo").closeFoldsWith(2) end, desc = " 󱃄 Close L2 Folds" },
			{ "z3", function() require("ufo").closeFoldsWith(3) end, desc = " 󱃄 Close L3 Folds" },
			{ "z4", function() require("ufo").closeFoldsWith(4) end, desc = " 󱃄 Close L4 Folds" },
		},
		init = function()
			-- INFO fold commands usually change the foldlevel, which fixes folds, e.g.
			-- auto-closing them after leaving insert mode, however ufo does not seem to
			-- have equivalents for zr and zm because there is no saved fold level.
			-- Consequently, the vim-internal fold levels need to be disabled by setting
			-- them to 99
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
		end,
		opts = {
			provider_selector = function(_, ft, _)
				-- INFO some filetypes only allow indent, some only LSP, some only
				-- treesitter. However, ufo only accepts two kinds as priority,
				-- therefore making this function necessary :/
				local lspWithOutFolding =
					{ "markdown", "bash", "sh", "bash", "zsh", "css", "html", "python" }
				if vim.tbl_contains(lspWithOutFolding, ft) then return { "treesitter", "indent" } end
				return { "lsp", "indent" }
			end,
			-- open opening the buffer, close these fold kinds
			-- use `:UfoInspect` to get available fold kinds from the LSP
			close_fold_kinds = { "imports" },
			open_fold_hl_timeout = 500,
		},
  config = function(_, opts)
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local totalLines = vim.api.nvim_buf_line_count(0)
      local foldedLines = endLnum - lnum
      local suffix = ("  %d lines folded"):format(foldedLines)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
			local rAlignAppndx = math.max(width - 15 - curWidth - sufWidth, 0)
				suffix = "    " .. (" "):rep(rAlignAppndx) .. suffix
      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end
    opts["fold_virt_text_handler"] = handler
    require("ufo").setup(opts)
		end,
	},
	{
		"chrisgrieser/nvim-origami",
		event = "BufReadPost", -- later will not save folds
		config = function()
			require("origami").setup({
				keepFoldsAcrossSessions = true,
				pauseFoldsOnSearch = true,
				setupFoldKeymaps = true,
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
					'SignColumn', 'CursorLineNr', 'EndOfBuffer'},
			})
		end,
		lazy = false,
	},
	{
		"junegunn/goyo.vim",
		lazy = false,
	},
}

return plugins
