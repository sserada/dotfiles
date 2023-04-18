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
keymap('n', '<C-e>', ':NvimTreeToggle<CR>', opts)

-- telescope
keymap('n', 'ff', ':Telescope find_files<CR>', opts)

-- luasnip
keymap('i', '<C-j>', 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<C-j>"', { expr = true })
keymap('s', '<C-j>', 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<C-j>"', { expr = true })
keymap('i', '<C-k>', 'luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : "<C-k>"', { expr = true })
keymap('s', '<C-k>', 'luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : "<C-k>"', { expr = true })

