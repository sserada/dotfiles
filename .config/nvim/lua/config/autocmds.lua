local autocmd = vim.api.nvim_create_autocmd -- Create an autocommand

-- Remove whitespace on save
autocmd("BufWritePre", {
    pattern = '*',
    command = ":%s/\\s\\+$//e"
})

-- Don't auto comment new lines
autocmd('BufEnter', {
    pattern = '*',
    command = "set fo-=c fo-=r fo-=o"
})

-- Highlight on yank
autocmd('TextYankPost', {
    pattern = '*',
    command = 'lua vim.highlight.on_yank {on_visual = false}'
})
