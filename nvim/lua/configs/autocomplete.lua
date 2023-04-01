-- vim.opt.completeopt={'menu', 'menuone', 'noselect'}
require("luasnip/loaders/from_vscode").lazy_load()
local M = {}

function M.config()
	-- Setup nvim-cmp.
	local cmp = require 'cmp'
  local luasnip = require 'luasnip'

	cmp.setup({
    snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				-- luasnip
				luasnip.lsp_expand(args.body)
				-- vsnip
				-- vim.fn["vsnip#anonymous"](args.body)
				-- snippy
				-- require('snippy').expand_snippet(args.body)
				-- ultisnip
				-- vim.fn["UltiSnips#Anon"](args.body)
			end,
		},
		mapping = {
			['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			['<C-y>'] = cmp.config.disable,
			['<C-e>'] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- Accept currently selected item...
			-- Set `select` to `false` to only confirm explicitly selected items:
			['<CR>'] = cmp.mapping.confirm({ select = true }),
		},
		sources = cmp.config.sources({
			{ name = 'luasnip' }, -- For luasnip users.
			{ name = 'nvim_lsp' },
			{ name = 'buffer' },
			{ name = 'nvim_lua' },
      { name = 'neorg' },
			-- { name = 'ultisnips' }, -- For ultisnips users.
			-- { name = 'snippy' }, -- For snippy users.
		  { name = 'path' },}),
    formatting = {
      fields = {'abbr', 'kind', 'menu'},
      -- fields = {'abbr', 'menu'},
      format = function(entry, item)
        local menu_icon = {
          luasnip = '    ⋗[LuaSnip]',
          nvim_lsp = '    λ[LSP]',
          buffer = '    Ω[Buffer]',
          nvim_lua = '     [Nvim_Lua]',
          neorg = '     [Neorg]',
          path = '    🖫 Path]',
        }

        item.menu = menu_icon[entry.source.name]
        return item
      end,
    },
    window = {
      documentation = cmp.config.window.bordered()
    },
	})

	-- You can also set special config for specific filetypes:
	--    cmp.setup.filetype('gitcommit', {
	--        sources = cmp.config.sources({
	--            { name = 'cmp_git' },
	--        }, {
	--            { name = 'buffer' },
	--        })
	--    })

	-- nvim-cmp for commands
	cmp.setup.cmdline('/', {
		sources = {
			{ name = 'buffer' }
		}
	})
	cmp.setup.cmdline(':', {
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	cmp.setup({

		mapping = {

			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),

			-- ... Your other mappings ...
		},

		-- ... Your other configuration ...
	})

  require("mason").setup()
  require("mason-lspconfig").setup()

  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require'lspconfig'.clangd.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.bashls.setup {
    capabilities = capabilities, }
  require'lspconfig'.arduino_language_server.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.cmake.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.neocmake.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.cssls.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.html.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.jsonls.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.jdtls.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.tsserver.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.ltex.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.lua_ls.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.intelephense.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.pylsp.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.lemminx.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.yamlls.setup {
    capabilities = capabilities,
  }


	local devicons = require('nvim-web-devicons')
	cmp.register_source('devicons', {
		complete = function(_, _, callback)
			local items = {}
			for _, icon in pairs(devicons.get_icons()) do
				table.insert(items, {
					label = icon.icon .. '  ' .. icon.name,
					insertText = icon.icon,
					filterText = icon.name,
				})
			end
			callback({ items = items })
		end,
	})

  require('lspsaga').setup({})

	require('rust-tools').setup()

end

return M
