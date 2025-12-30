-- モダンUI改善プラグイン
-- Neovimのコマンドライン、通知、メッセージUIを大幅に改善し、モダンで美しいUIを提供するプラグイン
return {
  "folke/noice.nvim",
  event = "VeryLazy", -- Neovim起動後、遅延ロード
  -- 依存関係
  dependencies = {
    "MunifTanjim/nui.nvim", -- UIコンポーネントライブラリ
    "rcarriga/nvim-notify", -- 通知プラグイン
  },
  opts = {
    -- LSP関連の設定
    lsp = {
      -- LSPのドキュメント表示を上書きしてnoiceで処理
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true, -- マークダウン変換を有効化
        ["vim.lsp.util.stylize_markdown"] = true, -- マークダウンスタイリングを有効化
        ["cmp.entry.get_documentation"] = true, -- nvim-cmpのドキュメント表示を上書き
      },
    },
    -- プリセット設定（よく使われる設定のセット）
    presets = {
      bottom_search = true, -- 検索を画面下部に表示
      command_palette = true, -- コマンドパレット風の表示
      long_message_to_split = true, -- 長いメッセージは分割表示
      inc_rename = false, -- LSPのリネームプレビューは無効（デフォルトを使用）
      lsp_doc_border = false, -- LSPドキュメントにボーダーを表示しない
    },
    -- メッセージルーティング設定（特定のメッセージの表示方法をカスタマイズ）
    routes = {
      {
        -- "written"メッセージ（ファイル保存時）をスキップ
        filter = {
          event = "msg_show", -- メッセージ表示イベント
          kind = "", -- 通常のメッセージ
          find = "written", -- "written"という文字列を含む
        },
        opts = { skip = true }, -- このメッセージはスキップ（表示しない）
      },
    },
  },
  -- キーマップ
  keys = {
    { "<leader>sn", "", desc = "+noice" }, -- which-keyのグループ表示用
    -- Shift+EnterでコマンドラインをリダイレクトしてSplitに表示
    {
      "<S-Enter>",
      function()
        require("noice").redirect(vim.fn.getcmdline())
      end,
      mode = "c", -- コマンドモード
      desc = "コマンドライン出力をリダイレクト",
    },
    -- 最後のメッセージを表示
    {
      "<leader>snl",
      function()
        require("noice").cmd("last")
      end,
      desc = "最後のメッセージを表示",
    },
    -- メッセージ履歴を表示
    {
      "<leader>snh",
      function()
        require("noice").cmd("history")
      end,
      desc = "メッセージ履歴を表示",
    },
    -- 全てのメッセージを表示
    {
      "<leader>sna",
      function()
        require("noice").cmd("all")
      end,
      desc = "全てのメッセージを表示",
    },
    -- 全ての通知を消去
    {
      "<leader>snd",
      function()
        require("noice").cmd("dismiss")
      end,
      desc = "全ての通知を消去",
    },
    -- LSPドキュメントを前方スクロール
    {
      "<c-f>",
      function()
        if not require("noice.lsp").scroll(4) then
          return "<c-f>" -- noiceで処理できない場合はデフォルトの動作
        end
      end,
      silent = true,
      expr = true, -- 式として評価
      desc = "LSPドキュメントを前方スクロール",
      mode = { "i", "n", "s" }, -- 挿入、ノーマル、選択モード
    },
    -- LSPドキュメントを後方スクロール
    {
      "<c-b>",
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-b>" -- noiceで処理できない場合はデフォルトの動作
        end
      end,
      silent = true,
      expr = true, -- 式として評価
      desc = "LSPドキュメントを後方スクロール",
      mode = { "i", "n", "s" }, -- 挿入、ノーマル、選択モード
    },
  },
}
