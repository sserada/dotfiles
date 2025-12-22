-- Gitの変更箇所を行番号の横に表示するプラグイン
return {
  "lewis6991/gitsigns.nvim",
  -- ファイル読み込み時にプラグインをロードする
  event = { "BufReadPre", "BufNewFile" },
  config = function() require("gitsigns").setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- ハンク(変更箇所)間の移動
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "次のハンクへ" })

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "前のハンクへ" })

        -- アクション
        -- ハンクをステージする
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "ハンクをステージ" })
        -- ハンクの変更を取り消す
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "ハンクをリセット" })
        -- ステージしたハンクを取り消す
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "ステージしたハンクを元に戻す" })
        -- blame情報を表示する
        map("n", "<leader>hb", gs.blame_line, { desc = "Blame" })
      end,
    })
  end,
}
