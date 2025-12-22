-- コードのコメントアウトを簡単に行うプラグイン
-- gccで現在行を、gc + モーションで範囲をコメントアウト/アンコメントできます。
return {
  "numToStr/Comment.nvim",
  -- ファイルを開いた時、またはキー入力があった時にロード
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup()
  end,
}
