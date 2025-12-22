local options = {
  encoding = 'utf-8',            -- エンコーディングをUTF-8に設定
  fileencoding = 'utf-8',        -- ファイルのエンコーディングをUTF-8に設定
  number = true,                 -- 行番号を表示
  ignorecase = true,             -- 検索時に大文字と小文字を区別しない
  smartcase = true,              -- 検索時に大文字が含まれている場合は区別する
  hidden = true,                 -- 保存されていないバッファを隠すことを許可
  backup = false,                -- バックアップファイルを作成しない
  autoindent = true,             -- 自動でインデントを調整
  smartindent = true,            -- 新しい行で賢くインデントを調整
  smarttab = true,               -- タブキーを賢く使う
  expandtab = true,              -- タブをスペースに展開
  shiftwidth = 2,                -- インデントの幅を2スペースに設定
  tabstop = 2,                   -- タブの幅を2スペースに設定
  laststatus = 3,                -- ステータスラインを常に表示 (グローバル)
  clipboard = 'unnamedplus',     -- クリップボードをシステムのクリップボードと共有
}

-- オプションを適用
for key, value in pairs(options) do
  vim.opt[key] = value
end

