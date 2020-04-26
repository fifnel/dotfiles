# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="candy"
plugins=(git git-flow vagrant knife gem bundler brew osx rsync rails tmuxinator docker docker-compose golang node)

source $ZSH/oh-my-zsh.sh


# Customize to your needs...

#----------------------------------------------
# シェルとして起動された場合に実行される設定
#----------------------------------------------
# 初回のみ                :×
# インタラクティブシェル時:○
# シェルスクリプト時      :×
#----------------------------------------------

# color
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# editor
export GIT_EDITOR='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
export EDITOR='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim'

# aliases
alias knife='nocorrect knife'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias tmux='tmux attach || tmux new'

# homebrew
export PATH="/usr/local/sbin:$PATH"
alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew'

# anyenv
eval "$(anyenv init -)"
export PATH="$HOME/.anyenv/bin:$PATH"

# goenv
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# direnv
eval "$(direnv hook zsh)"

# command history
function peco_select_history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco_select_history
bindkey '^r' peco_select_history

# ghq
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# z
source ~/.zsh.d/z/z.sh
function peco-z-search
{
    which peco z > /dev/null
    if [ $? -ne 0 ]; then
        echo "Please install peco and z"
        return 1
    fi
    local res=$(z | sort -rn | cut -c 12- | peco)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
    else
        return 1
    fi
}
zle -N peco-z-search
bindkey '^z' peco-z-search

# gcloud
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# パスの重複削除
typeset -U PATH

# vim: set ts=4 sw=4 sts=0 tw=0 enc=utf8
