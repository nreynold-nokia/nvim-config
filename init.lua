require('plugins')
require('lsp')

vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.shiftwidth = 2

vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.relativenumber = true

vim.opt.nu = true

vim.opt.undofile = true
vim.opt.incsearch = true

vim.opt.scrolloff = 15

vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'

vim.opt.cmdheight = 2

-- Git integration, may switch to gitsigns or something else
local neogit = require('neogit')
neogit.setup {}

-- Fuzzy file search and ripgrep, could switch to fzf
local telescope = require('telescope')
telescope.setup {
  defaults = {
    file_ignore_patterns = {"node_modules", "dist", "coverage"}
  }
}

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

-- Syntax highlighting
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "javascript", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[
  let mapleader = " "
  cmap back b#
  cmap gg Neogit
  cmap xx Explore
  colorscheme gruvbox
  let g:gruvbox_transparent_bg=1
  let g:gruvbox_contrast_dark="soft"
  let g:neoformat_try_node_exe=1
  autocmd BufWritePre *.mjs Neoformat
  autocmd BufWritePre *.jsx Neoformat
  autocmd BufWritePre *.ts Neoformat
  autocmd BufWritePre *.tsx Neoformat
  hi Normal guibg=NONE ctermbg=NONE
  nnoremap ff :Telescope find_files <cr>
  nnoremap fg :Telescope live_grep <cr>
  nnoremap <Leader>w <C-w><C-w>
]])
