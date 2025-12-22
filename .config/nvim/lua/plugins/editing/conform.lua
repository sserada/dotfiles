return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    -- Set up formatters
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shfmt" },
      zsh = { "shfmt" },
      markdown = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
    },

    -- Enable format on save
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
