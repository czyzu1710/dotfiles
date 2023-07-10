local keymap = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }

keymap("i", "jk", "<ESC>", default_options)
keymap("t", "jk", "C-\\><C-n>", default_options)
keymap("n", "<A-f>", ':Telescope find_files hidden=true<CR>', default_options)
keymap("n", "<A-F>", ':Telescope live_grep<CR>', default_options)
keymap("n", "<leader>za", ':TZAtaraxis<CR>', default_options)
keymap("n", "<C-s>", ':write<CR>', default_options)

-- NvimTree mappings
keymap("n", "<A-p>", ":NvimTreeFocus<CR>", default_options)
keymap("n", "<A-P>", ":NvimTreeClose<CR>", default_options)


-- LSP mappings
keymap("n", "<leader>f", ":LspZeroFormat<CR>", default_options)

-- Barbar mappings
keymap("n", "<A-,>", ":BufferPrevious<CR>", default_options)
keymap("n", "<A-.>", ":BufferNext<CR>", default_options)
keymap("n", "<C-p>", ":BufferPick<CR>", default_options)
keymap("n", "<A-c>", ":BufferClose<CR>", default_options)
keymap("n", "<A-s-c>", ":BufferRestore<CR>", default_options)
