#----------------------------------------------
# 初回ログイン時に実行される設定
#----------------------------------------------
# 初回のみ                :○
# インタラクティブシェル時:×
# シェルスクリプト時      :×
#----------------------------------------------

# 文字コード
export LANG=ja_JP.UTF-8

# for boot2docker
#if ! [ "`boot2docker status`" = "running" ]; then
#    boot2docker up
#fi
#if [ "`boot2docker status`" = "running" ]; then
#    $(boot2docker shellinit)
#fi
