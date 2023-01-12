local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opt = { silent = true }

-- NERDTreeToggle
keymap("n", "<C-e>", ":NERDTreeToggle<CR>", opts)
