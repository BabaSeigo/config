if &compatible
  set nocompatible " Be iMproved
endif

" Required:
" Add the dein installation directory into runtimepath
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('$HOME/.cache/dein')

" Let dein manage dein
call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1
" Use smartcase.
call deoplete#custom#option({
\ 'auto_complete_delay': 200,
\ 'smart_case': v:true,
\ })
call deoplete#custom#source('_', 'smart_case', v:true)

inoremap <expr><C-g>     deoplete#undo_completion()
inoremap <expr><C-l>     deoplete#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Q: I want to close the preview window after completion is done.
autocmd CompleteDone * silent! pclose!
" Add or remove your plugins here like this:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')


let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Required:
call dein#add('tomasr/molokai', {'merged': 0})
call dein#source('molokai')


call dein#add('plasticboy/vim-markdown')
let g:vim_markdown_folding_disabled=1
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')

" ショートカットでコメントアウトするプラグイン
call dein#add("tyru/caw.vim.git")
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)



" インデントに色を付けて見やすくする
call dein#add('nathanaelkane/vim-indent-guides')
" " vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" 2016/11/20追加
call dein#add('https://github.com/rhysd/accelerated-jk')
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" directoryのtreeを見やすくする
call dein#add('https://github.com/scrooloose/nerdtree')
nnoremap :tree :NERDTreeToggle

call dein#add('vim-scripts/YankRing.vim')
call dein#add('chrisbra/csv.vim')
let g:csv_highlight_column = 'y'
call dein#add('nelstrom/vim-visual-star-search')

call dein#add("vim-scripts/taglist.vim")
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"  
" taglistのウインドウだけならVimを閉じる
let Tlist_Exit_OnlyWindow = 1
" \lでtaglistウインドウを開いたり閉じたり出来るショートカット
map <silent> <leader>l :TlistToggle<CR>

call dein#add('terryma/vim-multiple-cursors')
call dein#end()
colorscheme molokai

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif
"
"
"
"
set encoding=utf-8
set showcmd
set clipboard+=unnamed
set mouse=a
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3
"syntax enable
" TABキーを押した際にタブ文字の代わりにスペースを入れる
set expandtab
set tabstop=2
" " タブを挿入するときの幅
set shiftwidth=4
set autoindent
set hlsearch
" backspaceが効かなくなっていた
set backspace=indent,eol,start
set background=dark
set number
set list  " 不可視文字を表示する
set listchars=tab:~>,trail:.,nbsp:%  " タブを >--- 半スペを . で表示する
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
noremap <C-j> <esc>
noremap! <C-j> <esc>
syntax on

filetype plugin on
" xで消した際にヤンクレジスタが汚れない
noremap PP "0p
noremap x "_x
set wildmenu wildmode=list:full
set title
set incsearch
autocmd QuickFixCmdPost grep cwindow
" *で検索して移動しないようにする
nmap * *N
