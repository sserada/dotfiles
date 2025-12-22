return {
  "eddyekofo94/gruvbox-flat.nvim",            -- フラットデザインのグルーヴボックスカラースキーム
  priority = 1000,                            -- 優先度を高く設定して、他のカラースキームよりも先に読み込む
  enabled = true,                             -- プラグインを有効化
  config = function()                         -- カラースキームの設定
    vim.cmd([[colorscheme gruvbox-flat]])     -- グルーヴボックスフラットカラースキームを適用
  end,
}
