local M = {}
function M.setup()

  local luasnip = require("luasnip")
  -- for selection snippets
  luasnip.config.set_config({
    store_selection_keys = '<C-s>',
  })
end

return M
