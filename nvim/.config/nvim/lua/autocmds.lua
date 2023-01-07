local augroup = vim.api.nvim_create_augroup -- create an autocommand group
local autocmd = vim.api.nvim_create_autocmd -- create an autocommand

-- remove whitespace on save
autocmd("BufWritePre", {
    pattern = '*',
    command = ":%s/\\s\\+$//e"
})

-- don't auto comment new lines
autocmd('BufEnter', {
    pattern = '*',
    command = "set fo-=c fo-=r fo-=o"
})

-- highlight on yank
autocmd('TextYankPost', {
    pattern = '*',
    command = 'lua vim.highlight.on_yank {on_visual = false}'
})
