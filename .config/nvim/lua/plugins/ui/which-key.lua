-- which-key: キーマップのヘルプ表示
-- キーを押した後に利用可能なコマンドをポップアップで表示し、キーマップを忘れても操作できるプラグイン
return {
  "folke/which-key.nvim",
  -- VimEnter時（Neovim起動完了時）にロード
  event = "VimEnter",
  opts = {
    -- プリセット（デフォルトのキーバインドを含める）
    preset = "modern",
    -- ポップアップが表示されるまでの遅延時間（ミリ秒）
    delay = 500,
    -- グループ名の登録
    -- これにより、which-keyのポップアップでグループごとに整理されて表示される
    spec = {
      -- ファイル関連（Telescope）
      { "<leader>f", group = "ファイル検索" },
      -- Git関連（Gitsigns）
      { "<leader>h", group = "Git操作" },
      -- ファイルツリー関連（Neo-tree）
      { "<leader>e", desc = "ファイルツリー" },
      { "<leader>o", desc = "ツリーフォーカス" },
    },
  },
}
