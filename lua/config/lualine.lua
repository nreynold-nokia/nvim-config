local M = {}

function M.setup()
  require('lualine').setup { 
    options = {
      theme = 'gruvbox',
      icons_enabled = false
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {'branch'}
    },
    inactive_sections = {
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }
  }
end

return M
