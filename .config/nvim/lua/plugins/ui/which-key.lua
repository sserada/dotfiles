-- which-key: キーマップのヘルプ表示
-- キーを押した後に利用可能なコマンドをポップアップで表示し、キーマップを忘れても操作できるプラグイン
return {
  "folke/which-key.nvim",
  -- VimEnter時（Neovim起動完了時）にロード
  event = "VimEnter",
  config = function()
    local which_key = require("which-key")

    which_key.setup({
      -- ポップアップの表示設定
      window = {
        border = "rounded",        -- ウィンドウの枠線スタイル
        position = "bottom",       -- 画面下部に表示
        margin = { 1, 0, 1, 0 },   -- マージン設定
        padding = { 1, 2, 1, 2 },  -- パディング設定
      },
      -- ポップアップが表示されるまでの遅延時間（ミリ秒）
      delay = 500,
    })

    -- <leader>キーのグループ名を登録
    -- これにより、which-keyのポップアップでグループごとに整理されて表示される
    which_key.add({
      -- ファイル関連（Telescope）
      { "<leader>f", group = "ファイル検索" },
      -- Git関連（Gitsigns）
      { "<leader>h", group = "Git操作" },
      -- ファイルツリー関連（Neo-tree）
      { "<leader>e", desc = "ファイルツリー" },
      { "<leader>o", desc = "ツリーフォーカス" },
    })
  end,
}
