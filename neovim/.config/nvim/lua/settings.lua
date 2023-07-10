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
opt.conceallevel = 3

opt.number = true
opt.relativenumber = true

opt.clipboard = 'unnamedplus'

opt.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.set_preferences({
  suggest_lsp_servers = false
})

lsp.setup_servers({ 'kotlin_language_server', 'lua_ls', 'java_language_server', 'yamlls', force = true })

lsp.setup_nvim_cmp {
  sources = {
    { name = 'omni' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  }
}

lsp.setup()

require("kanagawa").load("wave")

require("nvim-tree").setup()

require("lualine").setup {
  options = {
    theme = "kanagawa",
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

