
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    -- Packer
    use { "wbthomason/packer.nvim" }

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
      config = function()
        require("config.treesitter").setup()
      end
    }

    -- Gruvbox Theme
    -- use 'ellisonleao/gruvbox.nvim'

    -- Dracula Theme
    -- use 'Mofiqul/dracula.nvim'
    
    -- TokyoNight Theme
    use 'folke/tokyonight.nvim'
    
    -- Autocomplete
    use {
      'hrsh7th/nvim-cmp',
      requires = {
       'hrsh7th/cmp-nvim-lsp',
       'hrsh7th/cmp-buffer',
       'hrsh7th/cmp-path',
       'saadparwaiz1/cmp_luasnip',
      }, 
      config = function()
        require('config.cmp').setup()
      end
    }

    -- Luasnip snippets
    use {
      'L3MON4D3/LuaSnip',
      config = function()
        require("config.luasnip").setup()
      end
    }
    use "rafamadriz/friendly-snippets"

    -- Autopairs
    use {
      "windwp/nvim-autopairs",
      wants = "nvim-treesitter",
      config = function()
        require("config.autopairs").setup()
      end
    }

    -- Neorg
    use {
      "nvim-neorg/neorg",
      run = ":Neorg sync-parsers",
      config = function()
        require('config.neorg').setup() 
      end,
      requires = "nvim-lua/plenary.nvim"
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = {{'nvim-lua/plenary.nvim'}},
      config = function()
        require("config.telescope").setup()
      end
    }
    -- Vim Status Line
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons',
        opt = true
      },
      config = function()
        require("config.lualine").setup()
      end
    }

    -- Debugging
    use 'mfussenegger/nvim-dap'

    -- Formatting
    use 'sbdchd/neoformat'

    -- Harpoon
    use {
      "ThePrimeagen/harpoon",
      keys = { [[<leader>j]] },
      module = { "harpoon", "harpoon.cmd-ui", "harpoon.mark", "harpoon.ui", "harpoon.term" },
      wants = { "telescope.nvim" },
      config = function()
        require("config.harpoon").setup()
      end,
    }

     -- WhichKey
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        require("config.whichkey").setup()
      end,
      disable = false,
    }   

    -- NeoGit
    use {
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
