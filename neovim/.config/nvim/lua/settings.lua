local opt = vim.opt

opt.compatible = false
opt.cursorline = true

-- Set the behaviour of searching
opt.showmatch = true
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true

-- Set the behaviour of tab and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.colorcolumn = '120'

opt.number = true
opt.relativenumber = true

vim.g['catppuccin_flavour'] = 'frappe'
require('catppuccin').setup()

vim.cmd [[colorscheme catppuccin]]

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.set_preferences({
  suggest_lsp_servers = false
})

lsp.setup_nvim_cmp{
  sources = {
    { name = 'omni' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  }
}

lsp.setup()
