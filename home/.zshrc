# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git git-flow vagrant knife rbenv gem bundler brew osx rsync)
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
#alias code='VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*'

# oh-my-zsh plugin
#export NOTIFY_COMMAND_COMPLETE_TIMEOUT=10
#source ~/.zsh.d/zsh-notify/notify.plugin.zsh
# tmuxと相性悪いのでしばらく使用をやめる

# pythonz
if [ -s $HOME/.pythonz/etc/bashrc ]; then
    source $HOME/.pythonz/etc/bashrc
fi
export PATH=$HOME/.pythonz/bin:$PATH

# curl
# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# rbenv
eval "$(rbenv init -)"

# nodejs
export PATH=$HOME/.nodebrew/current/bin:$PATH

# golang
export GOPATH=$HOME/Develop/go
export PATH=$GOPATH/bin:$PATH

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

# vim: set ts=4 sw=4 sts=0 tw=0 enc=utf8
