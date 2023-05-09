local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = true,
      },
      view = {
        side = "left",
      }
    },
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
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
          },
        })
      end,

    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },

    lazy = false
  },
  {
    "andweeb/presence.nvim",
    lazy = false
  },
  -- {
  --   "sunjon/shade.nvim",
  --   config = function()
  --   require("shade").setup({
  --     overlay_opacity = 65,
  --     opacity_step = 1,
  --     keys = {
  --       brightness_up    = '<C-Up>',
  --       brightness_down  = '<C-Down>',
  --       toggle           = '<Leader>s',
  --     }
  --   })
  --   end,
  --   lazy = false
  -- },
  {
    "aduros/ai.vim",
    lazy = false
  },
  {
    "romainl/vim-cool",
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
    "tpope/vim-commentary",
   lazy = false
  },
  {
    'nvim-neorg/neorg',
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
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
}

return plugins
