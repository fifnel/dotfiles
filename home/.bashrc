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
export PATH=/usr/local/heroku/bin:/Users/fifnel/.pythonz/bin:/Users/fifnel/.nvm/v0.6.14/bin:/Users/fifnel/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

# vim: set ts=4 sw=4 sts=0 tw=0 enc=utf8

