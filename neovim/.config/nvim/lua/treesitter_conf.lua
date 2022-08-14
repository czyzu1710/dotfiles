require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'lua',
    'latex',
    'kotlin',
    'java',
    'markdown',
    'yaml',
    'sql',
    'javascript',
    'typescript',
    'html',
    'json',
    'bibtex',
  },

  sync_install = false,

  highlight = {
    enable = true
  },

  indent = {
    enable = true
  }


}
