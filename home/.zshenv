#----------------------------------------------
# いかなる場合も実行される設定
#----------------------------------------------
# 初回のみ                :×
# インタラクティブシェル時:○
# シェルスクリプト時      :○
#----------------------------------------------

case ${UID} in
0)
    LANG=C
    ;;
esac

# for rbenv
eval "$(rbenv init -)"

# for nodejs
export NODE_PATH=/usr/local/lib/node_modules
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
source ~/.nvm/nvm.sh

# for golang
export GOPATH=$HOME/.go

