local keymap = vim.api.nvim_set_keymap
local default_options = {noremap = true, silent = true}
local extra_opts = {noremap = true, expr = true, silent = true}

keymap("i", "jk","<ESC>", default_options)
keymap("t", "jk","C-\\><C-n>", default_options)
keymap("n", "<leader>v", ':CHADopen<CR>', default_options)
keymap("n", "<v", ':CHADopen --always-focus<CR>', default_options)
keymap("n", "<a-l>", ':tabnext<CR>', default_options)
keymap("n", "<a-h>", ':tabprevious<CR>', default_options)
keymap("n", "<a-f>", ':Telescope find_files<CR>', default_options)
keymap("n", "<a-F>", ':Telescope live_grep<CR>', default_options)
