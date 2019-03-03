" インクリメンタルサーチ関係
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <silent> <ESC><ESC> :noh<CR>

" 文字コード
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932
set fileformats=unix,dos,mac

" TAB関係
set shiftwidth=2
set tabstop=2
set autoindent

" 行番号
set number

" タブページを常に表示
set showtabline=2

" ラップしない
set nowrap

" C-a, C-x を 0スタートのときでも10進にする
set nrformats=

" ステータスライン
set statusline=%F%m%r%h%w\ [%{&fenc},%{&ff},%Y]\ [%04v\,%04l\/\%L]
" ステータスライン常に表示
set laststatus=2 

" 色を付ける
if has("syntax")
  syntax on
endif
  
 " 縦分割版gf
nnoremap gs :vertical wincmd f<CR>

" 80文字
set textwidth=80
if exists('&colorcolumn')
	set colorcolumn=+1
endif
noremap <Plug>(ToggleColorColumn)
            \ :<c-u>let &colorcolumn = len(&colorcolumn) > 0 ? '' : 81<CR>
" ノーマルモードの 'cc' に割り当てる
nmap cc <Plug>(ToggleColorColumn)

" for gtags
set tags=.tags;
map <C-g> :Gtags 
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
"map <C-l> :Gtags -f %<CR>
map <C-k> :Gtags -r <C-r><C-w><CR>

