# 日本語

# rmコマンド実行でゴミ箱へ
# 'rm' move ~/.Trash
#function rm () {
#  local path
#  for path in "$@"; do
#    # ignore any arguments
#    if [[ "$path" = -* ]]; then :
#    else
#      local dst=${path##*/}
#      # append the time if necessary
#      while [ -e ~/.Trash/"$dst" ]; do
#        dst="$dst "$(date +%H-%M-%S)
#      done
#      mv "$path" ~/.Trash/"$dst"
#    fi
#  done
#}

# lsコマンドオプション
alias ls='ls -lG'
alias la='ls -a'

# screen
alias screen='~/local/bin/screen-4.1.0'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# path
export PATH=/usr/local/heroku/bin:~/.pythonz/bin:$PATH
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
source ~/.nvm/nvm.sh

# vim: set ts=4 sw=4 sts=0 tw=0 enc=utf8

