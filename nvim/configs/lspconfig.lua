 require("nvchad.configs.lspconfig").defaults()
-- local config = require("configs.lspconfig")

local servers = { "html", "cssls", "clangd","lua_ls","rome","pyright"}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
