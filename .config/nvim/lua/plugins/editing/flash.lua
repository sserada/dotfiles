-- 高速カーソル移動プラグイン
-- 画面内の任意の位置へ2-3キーストロークで素早く移動できるプラグイン。EasyMotion/Hop/Leapの後継
return {
  "folke/flash.nvim",
  event = "VeryLazy", -- Neovim起動後、遅延ロード
  opts = {
    -- モード別の設定
    modes = {
      -- 文字検索モード（f/t）を無効化（sキーでの検索に統一）
      char = {
        enabled = false, -- f/tキーによる文字検索は無効
      },
    },
  },
  -- キーマップ
  keys = {
    -- sキーでFlash検索を開始（画面内の任意の場所へジャンプ）
    {
      "s",
      mode = { "n", "x", "o" }, -- ノーマル、ビジュアル、オペレーターモード
      function()
        require("flash").jump()
      end,
      desc = "Flash検索",
    },
    -- Sキーで構文ノード単位でジャンプ（Treesitter統合）
    {
      "S",
      mode = { "n", "x", "o" }, -- ノーマル、ビジュアル、オペレーターモード
      function()
        require("flash").treesitter()
      end,
      desc = "Treesitter構文ノードジャンプ",
    },
    -- rキーでリモートFlash（離れた場所を操作対象にする）
    {
      "r",
      mode = "o", -- オペレーターモードのみ（例: drで離れた場所を削除）
      function()
        require("flash").remote()
      end,
      desc = "リモートFlash",
    },
    -- RキーでTreesitter検索
    {
      "R",
      mode = { "o", "x" }, -- オペレーター、ビジュアルモード
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter検索",
    },
    -- Ctrl+sでFlash検索のトグル（コマンドモード）
    {
      "<c-s>",
      mode = { "c" }, -- コマンドモード
      function()
        require("flash").toggle()
      end,
      desc = "Flash検索のトグル",
    },
  },
}
