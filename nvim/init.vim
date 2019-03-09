set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'vim-ruby/vim-ruby'
Plug 'isRuslan/vim-es6'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
call plug#end()

filetype on
filetype indent on
filetype plugin on
syntax on
colorscheme one 
set background=dark
set termguicolors
set encoding=utf-8
set modeline
set mouse=a
set wildignore=*.swp,*.bak,*.pyc
set nobackup
set noswapfile
set nowrap
set tabstop=4
set shiftround
set expandtab
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
let &shiftwidth=&tabstop

let g:spacegray_underline_search = 1
let g:spacegray_use_italics = 1

let mapleader = ","

nnoremap <leader>t :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :AckFromSearch<CR>
nnoremap <leader>n :Vexplore<CR> 
nnoremap <leader>N :NERDTreeToggle<CR>
nnoremap <leader>a :Ag<CR>

" move around windows
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <m->> <C-W>>
nnoremap <m-<> <C-W><
nnoremap <m-+> <C-W>+
nnoremap <m--> <C-W>-

" [s]ave buffer (normal or insert)
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
vmap <C-v> <ESC>"+pa

let g:LanguageClient_serverCommands = {
\ 'ruby': ['/Users/aaroneikenberry/.rbenv/versions/2.4.3/bin/solargraph', 'stdio']
\ }

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

nnoremap <silent> K :call g:LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call g:LanguageClient#textDocument_definition()<CR>

let g:deoplete#enable_at_startup = 1

" Golang
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>gt :GoDeclsDir<cr>
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" Exit terminal
:tnoremap <Esc> <C-\><C-n>

