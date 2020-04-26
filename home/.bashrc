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

# curl
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# golang
export GOPATH=$HOME/Develop/go
export PATH=$GOPATH/bin:$PATH

# java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# direnv
eval "$(direnv hook bash)"

# vim: set ts=4 sw=4 sts=0 tw=0 enc=utf8

