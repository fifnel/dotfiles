# コマンドサーチパス
export PATH=~/local/bin/:~/local/pear/bin/:$PATH
export MANPATH=~/local/share/man/:$MANPATH
#export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
#export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

# プロンプトデザイン
export PS1="[\u@\h \W]\\$ "

# 色設定
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# 文字コード
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# node.js
source ~/.nvm/nvm.sh
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir

source ~/.bashrc
