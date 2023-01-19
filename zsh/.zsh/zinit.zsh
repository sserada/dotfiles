# zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

zinit light mollifier/anyframe # interactive filter

zinit ice depth=1 # for faster loading
zinit light romkatv/powerlevel10k # zsh theme

zinit ice wait'0'; zinit light zsh-users/zsh-completions # zsh completion
autoload -Uz compinit && compinit # enable completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # case insensitive completion
zstyle ':completion:*:default' menu select=1 # select completion by default

zinit light zsh-users/zsh-autosuggestions # syntax highlight
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244' # color of suggestion

