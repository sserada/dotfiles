local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opt = { silent = true }

-- Escキーのキーマッピング
-- インサートモードで jk または kj を入力するとEscキーとして動作
keymap('i', 'jk', '<esc>', term_opt)
keymap('i', 'kj', '<esc>', term_opt)

