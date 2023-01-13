local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opt = { silent = true }

-- Fern
keymap("n", "<C-e>", ":Fern . -reveal=% -drawer<CR>", opts)
