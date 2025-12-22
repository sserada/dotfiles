-- ステータスライン
-- 画面下部に美しいステータスラインを表示し、Git、LSP、ファイル情報などを一目で確認できるプラグイン
return {
  "nvim-lualine/lualine.nvim",
  -- 依存関係
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- ファイルアイコン表示
  },
  -- VimEnter時（Neovim起動完了時）にロード
  event = "VimEnter",
  opts = {
    options = {
      -- テーマ設定（カラースキームに自動適応）
      theme = "auto",
      -- セクション区切り文字のスタイル
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      -- グローバルステータスライン（全ウィンドウで共通）
      globalstatus = true,
    },
    -- ステータスラインの各セクション設定
    sections = {
      -- 左側セクション
      lualine_a = { "mode" },                    -- 現在のモード（NORMAL、INSERT等）
      lualine_b = { "branch", "diff" },          -- Gitブランチと差分統計
      lualine_c = { "filename" },                -- ファイル名
      -- 右側セクション
      lualine_x = { "diagnostics", "encoding", "fileformat", "filetype" }, -- 診断、エンコード、ファイル形式、ファイルタイプ
      lualine_y = { "progress" },                -- ファイル内の位置（パーセント）
      lualine_z = { "location" },                -- カーソルの行:列番号
    },
    -- 非アクティブウィンドウのステータスライン
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
  },
}
