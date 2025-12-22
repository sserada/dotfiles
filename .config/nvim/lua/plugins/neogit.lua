-- MagitのようなUIでGit操作を行うためのプラグイン
return {
  "NeogitOrg/neogit",
  -- 依存プラグイン
  dependencies = {
    "nvim-lua/plenary.nvim",   -- Luaの便利関数ライブラリ (Neogitに必須)
    "sindrets/diffview.nvim",  -- 差分表示を強化する (Neogitで任意)
  },

  -- :Neogit コマンド実行時にプラグインをロードする
  cmd = "Neogit",

  -- デフォルト設定で setup() を呼び出す
  config = true,
}
