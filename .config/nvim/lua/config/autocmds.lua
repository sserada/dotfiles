local autocmd = vim.api.nvim_create_autocmd -- autocmd作成用のAPIを変数に格納

-- ファイル保存時に行末の空白を削除
autocmd("BufWritePre", {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

-- 新しい行で自動的にコメントを挿入しないように設定
autocmd('BufEnter', {
  pattern = '*',
  command = "set fo-=c fo-=r fo-=o"
})

-- ヤンク（コピー）したテキストをハイライト
autocmd('TextYankPost', {
  pattern = '*',
  command = 'lua vim.highlight.on_yank {on_visual = false}'
})

-- 特定のファイルタイプでインデントガイドを無効化
autocmd('FileType', {
  pattern = {'help', 'terminal', 'dashboard'},
  command = 'IndentBlanklineDisable'
})

