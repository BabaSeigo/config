syntax enable
set tabstop=4
set autoindent
set hlsearch
" backspaceが効かなくなっていた
set backspace=indent,eol,start
set background=dark
set number
set list  " 不可視文字を表示する
set listchars=tab:>-,trail:.  " タブを >--- 半スペを . で表示する
"挿入モードでカーソル形状を変更
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"
" カーソル形状がすぐに元に戻らないのでタイムアウト時間を調整
set ttimeoutlen=10
" 挿入モードを抜けた時にカーソルが見えなくなる現象対策(なぜかこれで治る)
inoremap <ESC> <ESC>
"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするプラグインをここに記述
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
" texを使う方法http://d.hatena.ne.jp/alto_homotopy/20140409/1397012911
let g:quickrun_config = {}
let g:quickrun_config['tex'] = {
            \   'command' : 'latexmk',
            \   'outputter' : 'error',
            \   'outputter/error/error' : 'quickfix',
            \   'cmdopt': '-pdfdvi',
            \   'exec': ['%c %o %s']
            \ }
NeoBundle 'Shougo/vimfiler'
NeoBundle 'tomasr/molokai'
NeoBundle "Shougo/neocomplete.vim"
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_auto_select = 1
    let g:neocomplete#enable_enable_camel_case_completion = 0
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	

call neobundle#end()
" 起動時に未インストールプラグインをインストール
NeoBundleCheck
" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on
