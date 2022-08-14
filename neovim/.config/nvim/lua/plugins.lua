return require('packer').startup(function()
   use 'wbthomason/packer.nvim'
   use 'vimwiki/vimwiki'
   use 'lervag/vimtex'
   use 'L3MON4D3/LuaSnip'
   use 'rafamadriz/friendly-snippets'
   use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = {
      ':CHADdeps',
      'python3 -m chadtree deps'
    }
  }
  use {'catppuccin/nvim', as = 'catppucin'}
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'}},
  }
  use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate'
  }
  use {
    'Pocco81/true-zen.nvim'
  }
 end)

