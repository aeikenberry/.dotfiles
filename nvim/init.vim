
"   ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"   ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"   ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"   ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"   ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'

" Langs
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'vim-ruby/vim-ruby'

" File, Buffer Browsers
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Colors
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
call plug#end()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

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

" Deoplete Syntax Completion configurations
let g:deoplete#enable_at_startup = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:airline_powerline_fonts = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden = 1
let g:ale_set_highlights = 1
let g:ale_lint_on_text_changed = "always"
set completeopt+=noinsert

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
vmap <C-v> <ESC>"+pa

augroup MyAutoCommands
    autocmd!
    " Competions
    autocmd CompleteDone * silent! pclose!

    " whitespace strip on save
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" Settings
syntax on                " enable syntax highlighting
set termguicolors        " enable gui colors for terminal
set encoding=utf-8       " enconding
set modeline             " enable vim modelines
set mouse=a              " enable mouse for all modes
set noeb vb t_vb=		 " remove all errors; 'set visualbell noeb' to revert
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set nobackup
set noswapfile           " don't write .swp files
set undofile             " set permanent undo (default `undodir = ~/.local/share/nvim/undo/`
set nowrap               " don't wrap lines
set tabstop=4            " a tab is four spaces
let &shiftwidth=&tabstop " number of spaces to use for autoindenting
set shiftround           " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab            " expand tab to count tabstop n° of spaces
set backspace=indent,eol,start
                         " allow backspacing over everything in insert mode
set autoindent           " always set autoindenting on
set copyindent           " copy the previous indentation on autoindenting
set number               " always show line numbers
set showmatch            " show matching parenthesis with a quick jump
set ignorecase           " ignore case when searching with / or ?
set smartcase            " ignore case if search pattern is all lowercase,
                         "    case-sensitive otherwise
set smarttab             " insert tabs on the start of a line according to
                         "    shiftwidth, not tabstop
set hlsearch             " highlight search terms
set incsearch            " show search matches as you type
set hidden               " allow modified buffers to be hidden
set wildmode=longest,list:longest,full
set wildmenu             " diplay command completion listing and choice menu
set wildignorecase       " ignore case command completion menu
set shell=zsh\ --login   " default shell (iteractive)
set shellcmdflag=-ic     " default shell command for non interactive invocations
set showcmd              " show key spressed in lower-right corner
set sidescroll=1         " smooth side scrolling
set conceallevel=2       " conceal marked text
set fillchars=vert:┃,fold:\  " set various fillchars; in this case removes clobbering signs from folds
set inccommand=split     " real time preview of substitution commands

" Colorscheme
colorscheme onedark
set background=dark
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " True Colors
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
if exists('$TMUX')
    let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif

" mappings
let mapleader = ","

" remap <Esc> to jk in insert mode
inoremap jk <Esc>
inoremap kj <Esc>

" open [n]ew [t]ab with nt
nnoremap <leader>tn :tabnew<cr>

" toggle [r]elative line [n]umbers
nnoremap <silent><leader>rn :set invrelativenumber<CR>

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

" [re]load buffer
nnoremap <leader>re :e%<CR>

" [e]dit [n]ew buffer
nnoremap <leader>en :enew<CR>

nnoremap <leader>t :FZF<CR>
nnoremap <leader>b :Buffers<CR>

" [N]ERDTree
nnoremap <leader>N :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Easier increase/decrease indents
vnoremap > >gv
vnoremap < <gv

" Exit terminal
:tnoremap <Esc> <C-\><C-n>
