return {
  "github/copilot.vim",                 -- GitHub Copilotプラグイン
  lazy = false,                         -- 遅延読み込みを無効化
  cmd = "Copilot",                      -- Copilotコマンドで起動
  event = InsertEnter,                  -- 挿入モードに入ったときに起動
}
