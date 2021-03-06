set nocompatible



" colorscheme for console
if !has('gui_running')
    colorscheme desert
endif


" vim: set ts=4 sw=4 sts=0 tw=0




" 正規表現エンジンを旧型に
" Rubyの正規表現で重たい
"set re=1

"///////////////////////////////////////////////////////////////////////////////
" vundleの読み込み設定
"///////////////////////////////////////////////////////////////////////////////

"filetype off
"
"set rtp+=~/.vim/bundle/neobundle.vim/
"call neobundle#begin(expand('~/.vim/bundle/'))
"NeoBundleFetch 'Shougo/neobundle.vim'
"
"" I love neo*
"NeoBundle 'Shougo/vimproc.vim', {
"      \ 'build' : {
"      \     'windows' : 'tools\\update-dll-mingw',
"      \     'cygwin' : 'make -f make_cygwin.mak',
"      \     'mac' : 'make -f make_mac.mak',
"      \     'unix' : 'make -f make_unix.mak',
"      \    },
"      \ }
"NeoBundle 'Shougo/neocomplete'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/vimshell'
"
"" library
"NeoBundle 'L9'
"
"" utility
"NeoBundle 'Align'
"NeoBundle 'cecutil'
"NeoBundle 'grep.vim'
"NeoBundle 'project.tar.gz'
"NeoBundle 'rbgrouleff/bclose.vim'
"NeoBundle 'surround.vim'
"NeoBundle 'nishigori/increment-activator'
"NeoBundle 'sakuraiyuta/commentout.vim'
"NeoBundle 'tpope/vim-endwise'
"NeoBundle 'fugitive.vim'
"NeoBundle 'fuenor/qfixhowm'
"NeoBundle "osyo-manga/unite-qfixhowm"
"NeoBundle "aklt/plantuml-syntax"
"
"" colorscheme
"NeoBundle 'jellybeans.vim'
"NeoBundle 'vim-scripts/hybrid.vim'
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'itchyny/lightline.vim'
"
"" coding
"
"" test
"NeoBundle 'fifnel/ofaddinbox.vim'
"
"" 未使用
""NeoBundle 'tpope/vim-rails'
""NeoBundle 'ZenCoding.vim'
""NeoBundle 'quickrun.vim'
""NeoBundle 'html5.vim'
""NeoBundle 'jade.vim'
""NeoBundle 'cake.vim'
""NeoBundle 'nishigori/vim-sunday'
""NeoBundle 'h1mesuke/unite-outline'
""NeoBundle 'tomtom/tlib_vim'
""NeoBundle 'MarcWeber/vim-addon-mw-utils'
""NeoBundle 'incbufswitch.vim'
""NeoBundle 'snipMate'
""NeoBundle 'jcommenter.vim'
""NeoBundle 'tpope/vim-pathogen'
""NeoBundle 'davidoc/taskpaper.vim'
""NeoBundle 'EasyMotion'
""NeoBundle 'kien/ctrlp.vim'
""NeoBundle 'sgur/ctrlp-extensions.vim'
""NeoBundle 'SingleCompile'
""NeoBundle 'Source-Explorer-srcexpl.vim'
""NeoBundle 'osyo-manga/shabadou.vim'
""NeoBundle 'osyo-manga/vim-watchdogs'
""NeoBundle 'vim-scripts/cocoa.vim' " Plugin for Cocoa/Objective-C development
""NeoBundle 'tokorom/clang_complete'
""NeoBundle 'tokorom/clang_complete-getopts-ios'
""NeoBundle 'rcyrus/snipmate-snippets-rubymotion'
""NeoBundle 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
"
"filetype plugin indent on
"
"NeoBundleCheck
"
"call neobundle#end()
"
"
""///////////////////////////////////////////////////////////////////////////////
"" パスの追加
""///////////////////////////////////////////////////////////////////////////////
"set path+=/usr/local/include/
"
"
""///////////////////////////////////////////////////////////////////////////////
"" カラーリングの設定
""///////////////////////////////////////////////////////////////////////////////
"set t_Co=256
"colorscheme hybrid " カラースキーム
""highlight CursorLine ctermbg=black guibg=gray10   " カーソル行の色
"
"
"///////////////////////////////////////////////////////////////////////////////
" ステータスラインの表示
"///////////////////////////////////////////////////////////////////////////////
set statusline=%<    " 行が長すぎるときに切り詰める位置
set statusline+=[%n] " バッファ番号
set statusline+=%m   " %m 修正フラグ
set statusline+=%r   " %r 読み込み専用フラグ
set statusline+=%h   " %h ヘルプバッファフラグ
set statusline+=%w   " %w プレビューウィンドウフラグ
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
set statusline+=%y   " バッファ内のファイルのタイプ
set statusline+=\    " 空白スペース
if winwidth(0) >= 40
set statusline+=%F   " バッファ内のファイルのフルパス
else
set statusline+=%t   " ファイル名のみ
endif
set statusline+=%=   " 左寄せ項目と右寄せ項目の区切り
"set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
set statusline+=\ \  " 空白スペース2個
set statusline+=%1l  " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L   " バッファ内の総行数
set statusline+=,
set statusline+=%3c  " 何列目にカーソルがあるか
set statusline+=%V   " 画面上の何列目にカーソルがあるか
set statusline+=\ \  " 空白スペース2個
set statusline+=%03P " ファイル内の何％の位置にあるか
"
"
"
""///////////////////////////////////////////////////////////////////////////////
"" 基本設定
""///////////////////////////////////////////////////////////////////////////////
"set scrolloff=10               " スクロール時の余白確保
"set textwidth=0                " 一行に長い文章を書いていても自動折り返しをしない
"set nobackup                   " バックアップ取らない
"set autoread                   " 他で書き換えられたら自動で読み直す
"set noswapfile                 " スワップファイル作らない
"set hidden                     " 編集中でも他のファイルを開けるようにする
"set backspace=indent,eol,start " バックスペースでなんでも消せるように
"set formatoptions=lmoq         " テキスト整形オプション，マルチバイト系を追加
"set novisualbell               " ビジュアルベルを消す
"set vb t_vb=                   " ビープをならさない
"set browsedir=buffer           " Exploreの初期ディレクトリ
"set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
"set showmatch                  " 括弧の対応をハイライト
"set modeline                   " モードラインを有効にする
""set modelines=5                " モードラインの検索行数を設定
"
"" インデント
"set autoindent
"set smartindent
"set cindent
"set cinoptions=g0
"set tabstop=4 shiftwidth=4 softtabstop=0 " softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
"set expandtab " タブをスペースに展開しない
"
"" 補完・履歴
"set wildmenu               " コマンド補完を強化
"set wildchar=<tab>         " コマンド補完を開始するキー
"set wildmode=list:longest  " リスト表示
"set history=1000           " コマンド・検索パターンの履歴数
"set complete=.,w,b,u,t,i,k " 補完設定
"
"" とりあえずファイルタイプと同名の辞書を設定しておく
"autocmd FileType *  execute printf("setlocal dict+=~/.vim/dict/%s.dict", &filetype)
"
"
""-----------------------------------------
"" 検索設定
"set wrapscan   " 最後まで検索したら先頭へ戻る
"set ignorecase " 大文字小文字無視
"set smartcase  " 大文字ではじめたら大文字小文字無視しない
"set incsearch  " インクリメンタルサーチ
"set hlsearch   " 検索文字をハイライト
"
""選択した文字列を検索
"vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"
""選択した文字列を置換
"vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
"
""全体から置換
"nmap rs :%s///gc<Left><Left><Left><Left>
"
"
"
""///////////////////////////////////////////////////////////////////////////////
"" 見た目設定(CUI/GUI共通)
""///////////////////////////////////////////////////////////////////////////////
"set number           " 行番号表示
"
"set showcmd          " コマンドをステータス行に表示
"set cmdheight=1      " コマンドラインの高さ
"
"set laststatus=2     " 常にステータスラインを表示
"
"set previewheight=20 " プレビューウィンドウの高さ
"set splitbelow       " 横分割したら新しいウィンドウは下に
"set splitright       " 縦分割したら新しいウィンドウは右に
"
"set list             " 不可視文字表示
"set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
"set display=uhex     " 印字不可能文字を16進数で表示
"
"" 全角スペースをハイライト
"if has("syntax")
"    syntax on
"    function! ActivateInvisibleIndicator()
"        syntax match InvisibleJISX0208Space "　" display containedin=ALL
"        highlight InvisibleJISX0208Space term=underline ctermbg=Gray guibg=Gray
"    endf
"    augroup invisible
"        autocmd! invisible
"        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
"    augroup END
"endif
"
"" カレントウィンドウにのみ罫線を引く
"augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorline
"  autocmd WinEnter,BufRead * set cursorline
"augroup END
"
"
"
""///////////////////////////////////////////////////////////////////////////////
"" 基本キーマップ設定
""///////////////////////////////////////////////////////////////////////////////
"let mapleader = ","            " キーマップリーダー
"
"" 行単位で移動(1行が長い場合に便利)
"nnoremap <silent> j gj
"nnoremap <silent> k gk
"
"" 行頭・末
"nnoremap <silent> <space>l $
"nnoremap <silent> <space>h ^
"
"" CTRL-hjklでウィンドウ移動
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"nnoremap <C-h> <C-w>h
"
"" バッファ移動を簡単に
"nnoremap <silent>  <C-H> :bp<cr>
"nnoremap <silent>  <C-L> :bn<cr>
"
"" 検索などで飛んだらそこを真ん中に
"nmap <silent> n nzz
"nmap <silent> N Nzz
"nmap <silent> * *zz
"nmap <silent> # #zz
"nmap <silent> g* g*zz
"nmap <silent> g# g#zz
"nmap <silent> G Gzz
"
" usキーボードで使いやすく
nnoremap ; :
nnoremap : ;
"
"" insert中のカーソル移動＆C-hが死ぬので変わりをマップ
"inoremap <silent> <C-h> <left>
"inoremap <silent> <C-j> <down>
"inoremap <silent> <C-k> <up>
"inoremap <silent> <C-l> <right>
"inoremap <silent> <C-d> <delete>
"
""ハイライト消去
"nmap <space><ESC> ;nohlsearch<CR><ESC>
"
"" 縦に連番入力
"vnoremap <silent> co :ContinuousNumber <C-a><CR>
"command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
"
"" 行末までコピー
" map Y y$
"
""///////////////////////////////////////////////////////////////////////////////
"" エンコーディング関連
""///////////////////////////////////////////////////////////////////////////////
"" 改行文字
"set ffs=unix,dos,mac
"
"" デフォルトエンコーディング
"set   encoding=utf-8
"
"if has('win32') && has('kaoriya')
"  set   ambiwidth=auto
"else
"  set   ambiwidth=double
"endif
"
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
"
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213,euc-jp'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
"
"  set   fileencodings&
"  let &fileencodings = &fileencodings.','.s:enc_jis.',cp932,'.s:enc_euc
"
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif
"
"if has('win32unix')
"  set   termencoding=cp932
"endif
"
"
"
""///////////////////////////////////////////////////////////////////////////////
"" プラグインごとの設定
""///////////////////////////////////////////////////////////////////////////////
"
"" --------------------------------------------
"" lightline
"let g:lightline = {
"      \ 'colorscheme': 'jellybeans',
"      \ }
"
"" --------------------------------------------
"" grep.vim
"" :Gb <args> でGrepBufferする
"command! -nargs=1 Gb :GrepBuffer <args>
"" カーソル下の単語をGrepBufferする
"nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>
"
"" --------------------------------------------
"" vimshell
"let g:vimshell_editor_command = '/Applications/Editors/MacVim.app/Contents/MacOS/Vim'
"let g:vimshell_interactive_update_time = 10
""let g:vimshell_prompt = 
"let g:vimshell_user_prompt = 'getcwd()'
"nnoremap <silent> vs :VimShell<CR>
"nnoremap <silent> vsc :VimShellCreate<CR>
"nnoremap <silent> vp :VimShellPop<CR>
"
"
"" --------------------------------------------
"" neocomplete
""Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"let g:neocomplete#disable_auto_complete = 1
"
"" sources
"if !exists('g:neocomplete#sources')
"let g:neocomplete#sources = {}
"endif
""let g:neocomplete#sources._ = ['buffer', 'member', 'tag', 'syntax', 'include', 'vim', 'dictionary', 'file', 'file_include', 'omni', 'neosnippet']
"
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }
"
"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns = {}
""let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"inoremap <expr><C-s>     neocomplete#start_manual_complete()
"
"
""inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
""      \ <SID>check_back_space() ? "\<TAB>" :
""      \ neocomplete#start_manual_complete()
""function! s:check_back_space() "{{{
""  let col = col('.') - 1
""  return !col || getline('.')[col - 1]  =~ '\s'
""endfunction"}}}
"
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#smart_close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
""inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
"
"" For cursor moving in insert mode(Not recommended)
""inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
""inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
""inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
""inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
"" Or set this.
""let g:neocomplete#enable_cursor_hold_i = 1
"" Or set this.
""let g:neocomplete#enable_insert_char_pre = 1
"
"" AutoComplPop like behavior.
""let g:neocomplete#enable_auto_select = 1
"
"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplete#enable_auto_select = 1
""let g:neocomplete#disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"
"let g:neocomplete#sources#tags#cache_limit_size = 3000000
"
"
"
"" --------------------------------------------
"" neosnippet
"
"" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1
"" Tell Neosnippet about the other snippets
""let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
"
"" Plugin key-mappings.
"imap <C-y>     <Plug>(neosnippet_expand_or_jump)
"smap <C-y>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-y>     <Plug>(neosnippet_expand_target)
"
""" TAB
"imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump_or_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
""" S-TAB
"imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
"
""" SuperTab like snippets behavior.
""imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
""\ "\<Plug>(neosnippet_expand_or_jump)"
""\: pumvisible() ? "\<C-n>" : "\<TAB>"
""smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
""\ "\<Plug>(neosnippet_expand_or_jump)"
""\: "\<TAB>"
"
"" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif
"
"
"" --------------------------------------------
"" unite.vim
"" The prefix key.
"nnoremap [unite] <Nop>
"nmap <Space> [unite]
"
"nnoremap <silent> [unite]<space> :<C-u>Unite buffer<CR>
"nnoremap <silent> [unite]j :<C-u>Unite bookmark<CR>
"nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap <silent> [unite]p :<C-u>call <SID>unite_project('-start-insert')<CR>
"nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"
"nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"
"nnoremap <silent> [unite]s :<C-u>Unite source<CR>
""nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
"nnoremap <silent> [unite]n :<C-u>Unite snippet<CR>
"
"function! s:unite_project(...)
"  let opts = (a:0 ? join(a:000, ' ') : '')
"  let dir = unite#util#path2project_directory(expand('%'))
"  execute 'Unite' opts 'file_rec:' . dir
"endfunction
"
"" Start insert.
"let g:unite_enable_start_insert = 1
"
"autocmd FileType unite call s:unite_my_settings()
"function! s:unite_my_settings()"{{{
"" Overwrite settings.
"
"nmap <buffer> <ESC> <Plug>(unite_exit)
"imap <buffer> jj <Plug>(unite_insert_leave)
"imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
"
"" <C-l>: manual neocomplcache completion.
"inoremap <buffer> <C-l> <C-x><C-u><C-p><Down>
"endfunction"}}}
"
"let g:unite_source_file_mru_limit = 200
""let g:unite_cursor_line_highlight = 'TabLineSel'
""let g:unite_abbr_highlight = 'TabLine'
"
"" For optimize.
"let g:unite_source_file_mru_filename_format = ''
"
"call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
"
"" --------------------------------------------
"" vimfiler.vim
"let g:vimfiler_as_default_explorer = 1
"let g:vimfiler_safe_mode_by_default = 0
"nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
"
"
"" --------------------------------------------
"" qfixhowm.vim
"let QFixHowm_Key                        = ','
"if has('win32') || has('win64')
"  let g:howm_dir                        = '~/My Documents/Dropbox/howm'
"  let g:howm_keywordfile                  = '~/My Documents/Dropbox/howm/.howm-keys'
"  let g:mygrepprg                         = 'c:/gnuwin32/bin/grep'
"elseif has('mac')
"  let g:howm_dir                        = '~/Dropbox/Documents/howm-vim/'
"  let g:howm_keywordfile                  = '~/Dropbox/Documents/howm-vim/.howm-keys'
"  let g:mygrepprg                         = '/usr/bin/grep'
"elseif has('unix') && match(system('uname'),'Darwin')!=-1
"  let g:howm_dir                        = '~/Dropbox/Documents/howm-vim/'
"  let g:howm_keywordfile                  = '~/Dropbox/Documents/howm-vim/.howm-keys'
"  let g:mygrepprg                         = '/usr/bin/grep'
"else
"  let g:howm_dir                        = '~/Dropbpx/Documents/howm-vim/'
"  let g:howm_keywordfile                  = '~/Dropbox/Documents/howm-vim/.howm-keys'
"  let g:mygrepprg                         = '/bin/grep'
"endif
"let g:howm_filename                     = '%Y/%Y-%m-%d-%H%M%S.txt'
"let g:howm_fileencoding                 = 'utf-8'
"let g:howm_fileformat                   = 'unix'
"let g:MyGrep_ShellEncoding              = 'utf-8'
"let g:QFixHowm_RecentDays               = 10
"let g:QFixHowm_SaveTime                 = 2
"let g:QFixHowm_RecentMode               = 2
"let g:QFixHowm_Replace_Title_Pattern    = '^=\s*\(\[[:a-zA-Z0-9 ]*\]\s*\)\=$'
"let g:QFixHowm_Replace_Title_Len        = 64
"
"" --------------------------------------------
"" modeliner.vim
"let g:Modeliner_format = 'fenc= ts= sts= sw= tw= ft='
"
"" --------------------------------------------
"" bclose.vim
"let bclose_multiple = 1
"
"
"
""///////////////////////////////////////////////////////////////////////////////
"" ユーティリティ
""///////////////////////////////////////////////////////////////////////////////
"
"" vimgrepにいちいち|cwをつけるのがめんどくさい
"autocmd QuickfixCmdPost vimgrep cw
"
"" .vimrc読み込み後に余計なオプションが付加されてしまうので
"" (コメントの行頭文字を勝手に入れるやつをOFF)
"autocmd FileType * set formatoptions-=ro
"
"" ファイルを開いた場所をカレントディレクトリにする
"autocmd BufEnter *   execute ':lcd ' . expand('"%:p:h"')
"
"" quickfixコマンド後にcopenする指定
"au QuickfixCmdPost make,grep,grepadd,vimgrep copen
"
"" clang_complete-getopts-ios用
"autocmd FileType objc let g:clang_auto_user_options = 'path, .clang_complete, ios'
"
"" vim: set ts=4 sw=4 sts=0 tw=0
"
"" Vim､Ruby編集時にinsert modeが異常に重くなる現象の解決方法 - <s>gnarl,</s>技術メモ”’<marquee><textarea>￥
"" http://d.hatena.ne.jp/gnarl/20120308/1331180615
"" Don't screw up folds when inserting text that might affect them, until
"" leaving insert mode. Foldmethod is local to the window. Protect against
"" screwing up folding when switching between windows.
"autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
"autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
"
"
"" colorscheme for console
"if !has('gui_running')
"    colorscheme desert
"endif
"
"
