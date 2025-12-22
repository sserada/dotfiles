-- ファイルエクスプローラー
-- サイドバーにプロジェクトのファイルツリーを表示し、視覚的にファイルを管理できるプラグイン
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x", -- 安定版v3を使用
  -- 依存関係
  dependencies = {
    "nvim-lua/plenary.nvim",       -- 様々な機能で利用されるユーティリティライブラリ
    "nvim-tree/nvim-web-devicons", -- ファイルアイコン表示
    "MunifTanjim/nui.nvim",        -- UIコンポーネント
  },
  -- コマンド実行時に遅延ロード
  cmd = "Neotree",
  -- キーマップ
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "ファイルツリーの表示/非表示" },
    { "<leader>o", "<cmd>Neotree focus<cr>", desc = "ファイルツリーにフォーカス" },
  },
  opts = {
    -- ファイルシステムの動作設定
    filesystem = {
      -- 現在開いているファイルを自動的にツリー内で表示
      follow_current_file = {
        enabled = true,
      },
      -- netrw（Vim標準のファイルブラウザ）を置き換える
      hijack_netrw_behavior = "open_current",
    },
    -- ウィンドウの設定
    window = {
      position = "left", -- 画面左側に表示
      width = 30,        -- 幅は30文字
      -- ツリー内でのキーマップ
      mappings = {
        ["<space>"] = "none",    -- スペースキーの無効化
        ["l"] = "open",          -- lでファイルを開く/ディレクトリを展開
        ["h"] = "close_node",    -- hでディレクトリを閉じる
      },
    },
    -- 表示コンポーネントの設定
    default_component_configs = {
      indent = {
        with_expanders = true, -- 展開/折りたたみアイコンを表示
      },
    },
  },
}
