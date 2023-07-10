return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = {
      ':CHADdeps',
      'python3 -m chadtree deps'
    }
  }
  use { 'catppuccin/nvim', as = 'catppucin' }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'Pocco81/true-zen.nvim'
  }
  use {
    'Konfekt/vim-sentence-chopper'
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-omni' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  }

  use({ 'jakewvincent/mkdnflow.nvim',
    rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
    config = function()
      require('mkdnflow').setup({})
    end
  })

  use {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.norg.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "~/notes"
            },
          },
          ["core.norg.completion"] = {
            engine = "nvim-cmp"
          },
        },
      }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
  }
end)
