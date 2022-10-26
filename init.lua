require("plugins").setup()
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
