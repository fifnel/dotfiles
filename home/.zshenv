#
# PATH,MANPATH
#
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
#export MANPATH=/opt/local/share/man:$MANPATH

case ${UID} in
0)
    LANG=C
    ;;
esac

# color
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# editor
export GIT_EDITOR='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
export EDITOR=/usr/bin/vim

