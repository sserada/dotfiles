return {
  "hrsh7th/nvim-cmp",                                       -- オートコンプリートプラグインの本体
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",                                -- LSP設定
    "hrsh7th/cmp-nvim-lsp",                                 -- LSPソース
    "hrsh7th/cmp-buffer",                                   -- バッファ内テキストのソース
    "hrsh7th/cmp-path",                                     -- ファイルパスのソース
    "hrsh7th/cmp-cmdline",                                  -- コマンドラインのソース
    "hrsh7th/cmp-git",                                      -- Gitのソース
  },
  config = function()
    local cmp = require'cmp'
    cmp.setup({
      -- キーマッピングの設定
      mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item(),         -- 次の候補を選択
        ['<C-k>'] = cmp.mapping.select_prev_item(),         -- 前の候補を選択
        ['<C-h>'] = cmp.mapping.abort(),                    -- 補完を中断
        ['<C-l>'] = cmp.mapping.confirm({ select = true }), -- 候補を確定
        ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- 候補を確定
      }),
      -- 補完ソースの設定
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },                              -- LSPからの補完
      }, {
        { name = 'buffer' },                                -- 現在のバッファからの補完
      })
    })
    -- gitcommitファイルタイプ用の設定
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' },                               -- Gitのコミット履歴からの補完
      }, {
        { name = 'buffer' },
      })
    })
    -- コマンドライン（検索）用の設定
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
    -- コマンドライン（コマンド）用の設定
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }                                     -- パスからの補完
      }, {
        { name = 'cmdline' }                                  -- コマンドラインからの補完
      })
    })

  end,
}
