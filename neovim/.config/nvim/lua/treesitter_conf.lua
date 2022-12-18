require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'lua',
    'latex',
    'kotlin',
    'java',
    'markdown',
    'markdown_inline',
    'yaml',
    'sql',
    'javascript',
    'typescript',
    'html',
    'json',
    'bibtex',
    'nix',
  },

  sync_install = false,

  highlight = {
    enable = true
  },

  indent = {
    enable = true
  }


}
