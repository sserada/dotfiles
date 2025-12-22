-- nvim-surround: 括弧・引用符の操作を簡単にする
-- テキストを囲む文字（括弧、引用符、タグなど）を追加・変更・削除するプラグイン
return {
  "kylechui/nvim-surround",
  version = "*", -- 最新の安定版を使用
  -- ノーマルモード、ビジュアルモード移行時にロード
  event = { "BufReadPost", "BufNewFile" },
  -- デフォルト設定で使用（カスタマイズ不要）
  opts = {},
}
