-- あいまい検索(ファジーファインダー)を提供するプラグイン
-- ファイル、コード、バッファなどを横断的に検索するための統一されたUIを提供します。
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6", -- 安定版を追跡
  -- 依存関係
  dependencies = {
    -- telescopeの様々な機能で利用される必須ライブラリ
    "nvim-lua/plenary.nvim",
    -- パフォーマンス向上のため、C言語で書かれたFZFのソーターを導入
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      -- makeコマンドが利用可能な場合のみビルドを実行
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      -- プラグイン全体のデフォルト設定
      defaults = {
        path_display = { "truncate" }, -- パスが長い場合に短縮表示する
        -- 検索ウィンドウ内でのキーマップ
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,              -- 一つ前の選択肢へ
            ["<C-j>"] = actions.move_selection_next,                  -- 一つ次の選択肢へ
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- 検索結果をQuickfixリストに送る
          },
        },
      },
    })

    -- fzf拡張を読み込む (インストールされている場合)
    pcall(telescope.load_extension, "fzf")

    -- キーマップ
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "ファイル検索" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "最近開いたファイル" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "コード内を単語検索 (Grep)" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "開いているバッファを検索" })
  end,
}
