# zinit
[[ ! -f ~/.zsh/.zinit/.zinit.zsh ]] || source ~/.zsh/.zinit/.zinit.zsh

# powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.zsh/.zinit/.p10k.zsh ]] || source ~/.zsh/.zinit/.p10k.zsh

# alias
[[ ! -f ~/.zsh/.alias/.aliases.zsh ]] || source ~/.zsh/.alias/.aliases.zsh

# save location
HISTFILE=~/.zsh_history

# save location
HISTSIZE=100000
SAVEHIST=100000

# append to history file
set opt inc_append_history

# share history between sessions
setopt share_history

# ignore duplicate commands
setopt hist_ignore_dups

# don't save duplicate commands
setopt hist_save_no_dups

# ignore commands starting with space
setopt hist_ignore_space

# save timestamp and command duration
setopt extended_history

# remove duplicates first
setopt hist_expire_dups_first

### zinit
[[ ! -f ~/.zsh/.zinit.zsh ]] || source ~/.zsh/.zinit.zsh

# don't show duplicates in history search
setopt hist_find_no_dups

# remove duplicate blanks
setopt hist_reduce_blanks

#  select from menu
zstyle ':completion:*' menu select

#  case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#  list group names
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' groupname ''

# auto set slash to directories
setopt auto_param_slash

# auto cd to directory
setopt auto_cd

# after # are comments
setopt interactive_comments

# auto complete keys
setopt auto_param_keys

# auto correct
setopt correct

# auto menu
setopt auto_menu

# complete in word
setopt complete_in_word

# no beep
setopt no_beep

# ls colors
export LSCOLORS=gxfxcxdxbxegedabagacad

# search history
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
