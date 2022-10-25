
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- LSP
  use 'neovim/nvim-lspconfig'
  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    config = function()
        require('neorg').setup {
            -- check out setup part...
        }
    end,
    requires = "nvim-lua/plenary.nvim"
  }
  use 'ellisonleao/gruvbox.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use "rafamadriz/friendly-snippets"

  use 'saadparwaiz1/cmp_luasnip'
  use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'}
  use 'sbdchd/neoformat'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {{'nvim-lua/plenary.nvim'}}
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
    'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'mfussenegger/nvim-dap'

end)
