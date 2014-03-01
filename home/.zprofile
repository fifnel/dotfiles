# 文字コード
export LANG=ja_JP.UTF-8
#export LESSCHARSET=utf-8

# ruby
eval "$(rbenv init -)"

# node.js
source ~/.nvm/nvm.sh
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
