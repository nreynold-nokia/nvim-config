
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- For luasnip config
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
vim.opt.completeopt={"menu" ,"menuone", "noselect"}

local luasnip = require("luasnip")
-- for selection snippets
luasnip.config.set_config({
  store_selection_keys = '<C-s>',
})
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
      ['<Tab>'] = cmp.mapping(function(fallback)
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
