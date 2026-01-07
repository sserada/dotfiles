-- インデント可視化プラグイン
-- インデントレベルを縦線で可視化し、コードの階層構造を一目で把握できるようにするプラグイン
return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" }, -- ファイルを開いた時、または新規作成時に読み込み
  main = "ibl", -- モジュール名を明示的に指定（v3からのAPI）
  opts = {
    -- インデント線の設定
    indent = {
      char = "│", -- インデント線の文字（縦線）
      tab_char = "│", -- タブ文字のインデント線
    },
    -- スコープ（現在のコードブロック）の強調表示設定
    scope = {
      enabled = true, -- スコープの強調表示を有効化
      show_start = true, -- スコープの開始位置を表示
      show_end = false, -- スコープの終了位置は非表示（開始位置のみで十分）
    },
    -- 除外設定（特定のファイルタイプでは無効化）
    exclude = {
      filetypes = {
        "help", -- ヘルプファイル
        "neo-tree", -- ファイルツリー
        "Trouble", -- 診断リスト
        "lazy", -- プラグインマネージャー
        "mason", -- LSPインストーラー
        "notify", -- 通知ウィンドウ
        "toggleterm", -- ターミナル
      },
    },
  },
}
