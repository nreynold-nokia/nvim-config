local M = {}

function M.setup()
  require('lualine').setup { 
    options = {
      theme = 'tokyonight',
      icons_enabled = true
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {'filename'},
      lualine_c = {'branch'}
    },
    inactive_sections = {
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }
  }
end

return M
