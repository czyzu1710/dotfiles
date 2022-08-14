local set_keymap = vim.keymap.set
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local luasnip = require('luasnip')
local types = require('luasnip.util.types')
local options = { expr = true, silent = true, noremap = true }

require('luasnip.loaders.from_vscode').lazy_load()
-- Change choices in choiceNodes
set_keymap(
   {'i', 's'},
   '<A-Tab>',
  function()
    if luasnip.choice_active() then
      return '<Plug>luasnip-next-choice'
    else
      return '<A-Tab>'
    end
  end,
  options
)

-- Expand/Jump forward if a snippet is available
set_keymap('i', '<Tab>',
  function()
    if luasnip.expand_or_jumpable() then
      return '<Plug>luasnip-expand-or-jump'
    else
      return '<Tab>'
    end
  end,
  options
)

-- Jump backward
set_keymap(
  {'i', 's'},
  '<S-Tab>',
  function() luasnip.jump(-1) end,
  { silent = false, noremap = true }
)
