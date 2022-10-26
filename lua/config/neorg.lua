
local M = {}

function M.setup()
  -- neorg Org mode for neovim
  require('neorg').setup {
      load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
          config = {
              workspaces = {
                  work = "~/notes/work",
                  home = "~/notes/home",
              }
          }
        },
        ["core.norg.concealer"] = {
          config = { -- Note that this table is optional and doesn't need to be provided
            -- Configuration here
          }
        }
      }
  }
end

return M
