
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.opt.completeopt={"menu" ,"menuone", "noselect"}

-- Setup nvim-cmp
local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- for luasnip
    end,
  },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({select = true}), -- Accept currently selected item. set select to false to only confirm explicitly selected items
    }),
    sources = cmp.config.sources({
      {name = 'nvim_lsp'},
      {name = 'luasnip'},
    }, {
      {name = 'buffer'},
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      {name = 'cmp_git'},
      
    }, {
      {name = 'buffer'},
    })
  })

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