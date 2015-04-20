" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" or, invoked as 'git difftool'
if exists('$SUDO_USER') || exists('$GIT_DIR')
    finish
endif

set t_Co=256

" remove toolvar for gvim
if has('gui_running')
    set guioptions -=T
endif

set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト (2013-07-03 14:30 修正）

" indent
set autoindent
set cindent
set tabstop=4
set shiftwidth=4
set expandtab

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set showtabline=2
set noshowmode

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'"

set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>
"
" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

" Swapファイル？Backupファイル？前時代的すぎ
" なので全て無効化する
set nowritebackup
set nobackup
set noswapfile

set list                " 不可視文字の可視化
set number              " 行番号の表示
set wrap                " 長いテキストの折り返し

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

" QuickFixおよびHelpでは q でバッファを閉じる
" autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif

" NeoBundle
"

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" 非同期通信を可能にする
" 'build'が指定されているのでインストール時に自動的に
" 指定されたコマンドが実行され vimproc がコンパイルされる
NeoBundle "Shougo/vimproc", {
            \ "build": {
            \   "windows"   : "make -f make_mingw32.mak",
            \   "cygwin"    : "make -f make_cygwin.mak",
            \   "mac"       : "make -f make_mac.mak",
            \   "unix"      : "make -f make_unix.mak",
            \ }}


NeoBundleLazy "Shougo/unite.vim", {
            \   'autoload' : {
            \       'commands' : [ "Unite" ]
            \   }
            \}


NeoBundleLazy 'Shougo/vimfiler', {
            \   'depends' : ["Shougo/unite.vim"],
            \   'autoload' : {
            \       'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer" ]
            \   }
            \}

" molokai
NeoBundle 'tomasr/molokai'

" 三種の神器
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/YankRing.vim'

"" neocomplcache
NeoBundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : ''
            \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

NeoBundleLazy 'Shougo/neocomplete.vim', {
            \ "autoload": {"insert": 1}}

NeoBundleLazy 'fatih/vim-go',{
            \ "autoload" : {"filetypes" : ["go"]}}

NeoBundle 'JuliaLang/julia-vim'

NeoBundleLazy 'mattn/benchvimrc-vim', {
            \ 'autoload': {
            \   'commands': ['BenchVimrc'],
            \  }}

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

syntax on
colorscheme molokai
highlight Normal ctermbg=none
