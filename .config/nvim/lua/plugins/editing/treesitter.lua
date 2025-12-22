-- nvim-treesitter: より高度な構文解析とハイライトを提供
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,      -- 起動時に即時ロード
  priority = 1000,   -- 他のプラグインより優先
  build = ":TSUpdate",
  opts = {
    -- ハイライトを有効化
    highlight = {
      enable = true,
    },
    -- インデントを有効化
    indent = {
      enable = true,
    },
    -- インストールするパーサーのリスト
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "typescript",
      "python",
      "html",
      "css",
      "markdown",
      "bash",
    },
    -- 新しいパーサーが利用可能になった場合に自動でインストール
    auto_install = true,
  },
}
