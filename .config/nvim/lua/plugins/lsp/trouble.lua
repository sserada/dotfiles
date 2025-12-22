-- trouble.nvim: LSP診断リストの表示
-- エラー、警告、参照などをわかりやすくリスト表示するプラグイン
return {
  "folke/trouble.nvim",
  -- 依存関係
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- ファイルアイコン表示
  },
  -- コマンド実行時に遅延ロード
  cmd = "Trouble",
  -- キーマップ
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "診断リスト（Trouble）",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "バッファの診断リスト（Trouble）",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "シンボル一覧（Trouble）",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP定義/参照/その他（Trouble）",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "ロケーションリスト（Trouble）",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfixリスト（Trouble）",
    },
  },
  opts = {
    -- 診断の自動フォーカス設定
    focus = true,
  },
}
