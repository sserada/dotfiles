-- バッファライン（タブ風のバッファ表示）
-- 画面上部に開いているバッファ（ファイル）をタブのように表示し、視覚的に管理できるプラグイン
return {
  "akinsho/bufferline.nvim",
  version = "*", -- 最新の安定版を使用
  -- 依存関係
  dependencies = "nvim-tree/nvim-web-devicons", -- ファイルアイコン表示
  event = "VeryLazy", -- Neovim起動後、遅延ロード
  opts = {
    options = {
      mode = "buffers", -- バッファモードで動作（タブではなくバッファを表示）
      separator_style = "slant", -- セパレーターのスタイル（斜めライン）
      always_show_bufferline = true, -- バッファが1つでも常に表示
      show_buffer_close_icons = true, -- 各バッファに閉じるアイコンを表示
      show_close_icon = false, -- 右端の閉じるアイコンは非表示
      color_icons = true, -- ファイルアイコンをカラー表示
      diagnostics = "nvim_lsp", -- LSP診断情報をバッファラインに表示
      -- 診断インジケーターの表示形式をカスタマイズ
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      -- 他のウィンドウ（neo-treeなど）との位置調整
      offsets = {
        {
          filetype = "neo-tree", -- neo-treeが開いている場合
          text = "File Explorer", -- 表示するテキスト
          text_align = "center", -- テキストを中央揃え
          separator = true, -- セパレーターを表示
        },
      },
    },
  },
  -- キーマップ
  keys = {
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "次のバッファへ移動" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "前のバッファへ移動" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "バッファをピン留め/解除" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "ピン留めされていないバッファを削除" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "現在のバッファ以外を削除" },
    { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "右側のバッファを削除" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "左側のバッファを削除" },
  },
}
