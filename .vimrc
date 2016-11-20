set nocompatible
filetype plugin indent on
set encoding=utf-8
scriptencoding
" set paste
set showcmd
set clipboard+=unnamed
set mouse=a


"syntax enable
set tabstop=2
" " タブを挿入するときの幅
set shiftwidth=2
set autoindent
set hlsearch
" backspaceが効かなくなっていた
set backspace=indent,eol,start
set background=dark
set number
set list  " 不可視文字を表示する
set listchars=tab:~>,trail:.  " タブを >--- 半スペを . で表示する
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
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Align'
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
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


NeoBundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'https://github.com/vim-scripts/SQLUtilities.git'
NeoBundle 'https://github.com/Konfekt/FastFold'
vmap <silent>sf        <Plug>SQLUFormatter<CR> 
nmap <silent>scl       <Plug>SQLUCreateColumnList<CR> 
nmap <silent>scd       <Plug>SQLUGetColumnDef<CR> 
nmap <silent>scdt      <Plug>SQLUGetColumnDataType<CR> 
nmap <silent>scp       <Plug>SQLUCreateProcedure<CR> 
NeoBundle 'terryma/vim-multiple-cursors'
au BufRead,BufNewFile *.md set filetype=markdown
NeoBundle "tyru/caw.vim.git"
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" " vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" 2016/11/20追加
NeoBundle 'https://github.com/rhysd/accelerated-jk'
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

NeoBundle 'https://github.com/scrooloose/nerdtree'
nnoremap :tree :NERDTreeToggle

call neobundle#end()
" 起動時に未インストールプラグインをインストール
NeoBundleCheck
" ファイルタイプ別のプラグイン/インデントを有効にする
"filetype plugin indent on
filetype plugin on


" xで消した際にヤンクレジスタが汚れない
noremap PP "0p
noremap x "_x
set wildmenu wildmode=list:full
set title
set incsearch
autocmd QuickFixCmdPost *grep* cwindow



syntax on
colorscheme molokai
