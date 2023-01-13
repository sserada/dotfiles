local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opt = { silent = true }

-- esc
keymap('i', 'jk', '<esc>', term_opt)
keymap('i', 'kj', '<esc>', term_opt)

-- Fern
keymap("n", "<C-e>", ":Fern . -reveal=% -drawer<CR>", opts)
