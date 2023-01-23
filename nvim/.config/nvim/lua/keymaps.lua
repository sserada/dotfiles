local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opt = { silent = true }

-- tab
keymap('n', '<TAB>', ':bnext<CR>', opts)
keymap('n', '<SPACE>w', '<C-w><C-w>', opts)

-- esc
keymap('i', 'jk', '<esc>', term_opt)
keymap('i', 'kj', '<esc>', term_opt)

-- nvim-tree
keymap("n", "<C-e>", ":NvimTreeToggle<CR>", opts)

-- telescope
keymap("n", "ff", ":Telescope find_files<CR>", opts)
