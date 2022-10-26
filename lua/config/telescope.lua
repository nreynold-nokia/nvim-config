local M = {}

function M.setup()
-- Fuzzy file search and ripgrep, could switch to fzf
local telescope = require('telescope')
  telescope.setup {
    defaults = {
      file_ignore_patterns = {"node_modules", "dist", "coverage"}
    }
  }
end

return M
