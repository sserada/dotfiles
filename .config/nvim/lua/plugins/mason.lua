return {
  "williamboman/mason.nvim",                          -- 外部ツールのインストールと管理用プラグイン
  dependencies = {
    "williamboman/mason-lspconfig.nvim",              -- mason.nvimとnvim-lspconfigの連携用プラグイン
    "WhoIsSethDaniel/mason-tool-installer.nvim",      -- mason.nvimで外部ツールを自動インストールするためのプラグイン
  },
  config = function()
    -- Masonのセットアップ
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",                    -- インストール済みのパッケージのアイコン
          package_pending = "➜",                      -- インストール中のパッケージのアイコン
          package_uninstalled = "✗",                  -- 未インストールのパッケージのアイコン
        },
      },
    })

    mason_lspconfig.setup({                           -- nvim-lspconfig用のLSPサーバーを自動インストール
      ensure_installed = {
        "tsserver",                                   -- TypeScript/JavaScript
        "html",                                       -- HTML
        "cssls",                                      -- CSS
        "tailwindcss",                                -- Tailwind CSS
        "svelte",                                     -- Svelte
        "lua_ls",                                     -- Lua
        "graphql",                                    -- GraphQL
        "emmet_ls",                                   -- Emmet
        "prismals",                                   -- Prisma
        "pyright",                                    -- Python
      },
    })

    mason_tool_installer.setup({                       -- 外部ツール（フォーマッターやリンター）を自動インストール
      ensure_installed = {
        "prettier",                                    -- コードフォーマッター
        "stylua",                                      -- Luaフォーマッター
        "isort",                                       -- Pythonのimportソート
        "black",                                       -- Pythonフォーマッター
        "pylint",                                      -- Pythonリンター
        "eslint_d",                                    -- ESLintデーモン
      },
    })
  end,
}
