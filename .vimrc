" plugins

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround',
Plug 'tpope/vim-commentary',
Plug 'tpope/vim-repeat',
Plug 'junegunn/vim-slash',
Plug 'tiagofumo/vim-nerdtree-syntax-highlight',
Plug 'ryanoasis/vim-devicons',
Plug 'itchyny/lightline.vim',
Plug 'frazrepo/vim-rainbow',

call plug#end()

" editor
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set path+=**
set wildmenu

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =2         " Tab key indents by 2 spaces.
set shiftwidth  =2         " >> indents by 2 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set nu rnu

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set report      =0         " Always report changed lines.

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" mappings
let mapleader = ' '
nmap ; :
nmap <Leader>fs :e $MYVIMRC<CR>
map <Leader>v :vs<CR>
map <Leader>s :sp<CR>
map <Leader>q :q<CR>
map <Leader>r :source $MYVIMRC<CR>
map <Leader>x :bdelete<CR>
map <C-d> <C-d>zz
map <C-u> <C-u>zz

" splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" gui stuff
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
" clear splits
set fillchars+=vert:\ 
" clear lines
set fillchars+=eob:\ 

" plugin stuff
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=30
let g:cool_total_matches = 1
let g:rainbow_active = 1
