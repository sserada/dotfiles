return {
  "andweeb/presence.nvim",                            -- Discord Rich Presenceプラグイン
  lazy = false,
  auto_update         = true,                         -- 自動更新を有効化
  neovim_image_text   = "The One True Text Editor",   -- Neovim画像にカーソルを合わせたときに表示されるテキスト
  main_image          = "neovim",                     -- メイン画像 ("neovim" または "file")
  client_id           = "793271441293967371",         -- DiscordアプリケーションのクライアントID
  log_level           = nil,                          -- ログレベル ("debug", "info", "warn", "error")
  debounce_timeout    = 10,                           -- イベントのデバウンスタイムアウト（秒）
  enable_line_number  = false,                        -- プロジェクト名の代わりに現在の行番号を表示
  blacklist           = {},                           -- Rich Presenceを無効にするファイル名、パス、ワークスペースのリスト
  buttons             = true,                         -- Rich Presenceボタンを設定
  file_assets         = {},                           -- ファイル名や拡張子に基づいたカスタムファイルアセット定義
  show_time           = true,                         -- 経過時間を表示

  -- Rich Presenceのテキストオプション
  editing_text        = "Editing %s",                 -- 編集可能なファイルを編集中に表示されるテキスト
  file_explorer_text  = "Browsing %s",                -- ファイルエクスプローラーを閲覧中に表示されるテキスト
  git_commit_text     = "Committing changes",         -- Gitコミット中に表示されるテキスト
  plugin_manager_text = "Managing plugins",           -- プラグイン管理中に表示されるテキスト
  reading_text        = "Reading %s",                 -- 読み取り専用ファイルを閲覧中に表示されるテキスト
  workspace_text      = "Working on %s",              -- Gitリポジトリ内で作業中に表示されるテキスト
  line_number_text    = "Line %s out of %s",          -- `enable_line_number`がtrueの場合に表示される行番号テキスト
}
