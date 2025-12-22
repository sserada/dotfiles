# zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# テーマ: Powerlevel10k
zinit ice depth=1 # for faster loading
zinit light romkatv/powerlevel10k

# 補完機能
zinit ice wait'0'; zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit # enable completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # case insensitive completion
zstyle ':completion:*:default' menu select=1 # select completion by default

# オートサジェスト（入力候補を灰色で表示）
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244' # color of suggestion

# シンタックスハイライト（コマンドの色分け表示）
zinit light zsh-users/zsh-syntax-highlighting

# fzf（ファジーファインダー）
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf

