-- ターミナル統合プラグイン
-- Neovim内でターミナルを便利に使うためのプラグイン。フロート、水平分割、垂直分割など複数の表示方法をサポート
return {
  "akinsho/toggleterm.nvim",
  version = "*", -- 最新の安定版を使用
  opts = {
    -- ターミナルのサイズを動的に計算
    size = function(term)
      if term.direction == "horizontal" then
        return 15 -- 水平分割時は15行
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4 -- 垂直分割時は画面幅の40%
      end
    end,
    open_mapping = [[<C-\>]], -- Ctrl+\ でターミナルをトグル
    hide_numbers = true, -- ターミナルウィンドウで行番号を非表示
    shade_terminals = true, -- ターミナルの背景を少し暗くする
    shading_factor = 2, -- 背景の暗さの度合い
    start_in_insert = true, -- ターミナルを開いた時に自動的に挿入モードへ
    insert_mappings = true, -- 挿入モードでもopen_mappingを有効化
    terminal_mappings = true, -- ターミナルモードでもopen_mappingを有効化
    persist_size = true, -- ターミナルのサイズを記憶
    persist_mode = true, -- ターミナルのモード（挿入/ノーマル）を記憶
    direction = "float", -- デフォルトの表示方法（フロート＝画面中央にポップアップ）
    close_on_exit = true, -- プロセス終了時にターミナルウィンドウを自動的に閉じる
    shell = vim.o.shell, -- システムのデフォルトシェルを使用
    -- フロート表示時の設定
    float_opts = {
      border = "curved", -- ボーダーのスタイル（カーブした線）
      winblend = 0, -- ウィンドウの透明度（0=不透明）
      highlights = {
        border = "Normal", -- ボーダーのハイライトグループ
        background = "Normal", -- 背景のハイライトグループ
      },
    },
  },
  -- キーマップ
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "ターミナルの表示/非表示", mode = { "n", "t" } },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "フロートターミナルを開く" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "水平分割ターミナルを開く" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "垂直分割ターミナルを開く" },
  },
}
