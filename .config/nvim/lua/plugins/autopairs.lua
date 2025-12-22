-- 括弧や引用符などを自動で補完するプラグイン
return {
  "windwp/nvim-autopairs",
  -- Insertモードに入った時にロード
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({})

    -- nvim-cmpとの連携設定
    -- 補完を確定した際に、autopairsの補完と競合しないようにする
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
