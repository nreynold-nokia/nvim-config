
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local custom_attach = function()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
  vim.keymap.set("n", "dn", vim.diagnostic.goto_next, {buffer = 0})
  vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, {buffer = 0})
  vim.keymap.set("n", "gr", vim.lsp.buf.rename, {buffer = 0})
  vim.keymap.set("n", "gu", vim.lsp.buf.references, {buffer = 0})

end

require("luasnip.loaders.from_vscode").lazy_load()
require('lspconfig').gopls.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
require'lspconfig'.bashls.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
require'lspconfig'.tsserver.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
require'lspconfig'.jsonls.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
