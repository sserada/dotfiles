# fzf configuration
# ファジーファインダーの設定とキーバインド

# fzfのデフォルトオプション
export FZF_DEFAULT_OPTS="
  --height 40%
  --layout=reverse
  --border
  --inline-info
  --preview-window=right:60%
  --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down
"

# コマンド履歴検索 (Ctrl+R)
function fzf-history-selection() {
  BUFFER=$(history -n 1 | tac | awk '!a[$0]++' | fzf --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fzf-history-selection
bindkey '^r' fzf-history-selection

# ファイル検索してエディタで開く (Ctrl+F)
function fzf-file-widget() {
  local selected_file=$(find . -type f | fzf --preview 'bat --color=always --style=numbers {}' 2>/dev/null)
  if [[ -n "$selected_file" ]]; then
    BUFFER="$EDITOR $selected_file"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N fzf-file-widget
bindkey '^f' fzf-file-widget

# ディレクトリ検索して移動 (Ctrl+G)
function fzf-cd-widget() {
  local selected_dir=$(find . -type d | fzf)
  if [[ -n "$selected_dir" ]]; then
    BUFFER="cd $selected_dir"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N fzf-cd-widget
bindkey '^g' fzf-cd-widget
