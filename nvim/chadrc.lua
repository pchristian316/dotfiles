---@type ChadrcConfig 
local M = {}

M.ui = {
  theme = 'kanagawa',
  statusline = {
    separator_style = "block",
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
