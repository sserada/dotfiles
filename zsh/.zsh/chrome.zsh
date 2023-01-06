local c="Google Chrome"

# search
ggl() {
    if [ $(echo $1 | grep "^-[cfs]$") ]; then
        local opt=$1
        shift
    fi
    local url="https://google.co.jp/search?q=${*// /+}"
    open $url -a $c;
}

# localhost
alias lh='open "http://localhost:3000/" -a $c'

# deepl
alias dpl='open "https://www.deepl.com/ja/translator" -a $c'

# atcoder
alias atc='open "https://atcoder.jp/?lang=ja" -a $c'

# atcoder problems
alias atp='open "https://kenkoooo.com/atcoder/#/table/" -a $c'

# github profile
alias gpf='open "https://github.com/SO0O0" -a $c'

# github home
alias ghm='open "https://github.com/" -a $c'

# .gitignore.io
alias gii='open "https://www.toptal.com/developers/gitignore" -a $c'

# twitter
alias tw='open "https://twitter.com/" -a $c'

# youtube
alias yt='open "https://www.youtube.com/" -a $c'

# vuetify
alias vtf='open "https://vuetifyjs.com/ja/getting-started/installation/" -a $c'

# webclass
alias wcl='open "https://webclass.tcu.ac.jp/webclass/login.php" -a $c'
