---@type ChadrcConfig 
local M = {}

M.ui = {
	theme = 'kanagawa',
	statusline = {
		separator_style = "block",
	},
	hl_override = {
		-- CursorLine = {
		-- 	bg = "#223249"
		-- },
	},
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
