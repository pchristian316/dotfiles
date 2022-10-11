local M = {}
function M.config()
  local neorg = require 'neorg'

  neorg.setup({
    load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {},
      ["core.integrations.nvim-cmp"] = {},
    }
  })
end

return M
