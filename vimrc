" Leader
let mapleader = " "

set nocompatible
set backspace=indent,eol,start  " Makes backspace key more powerful.
set noerrorbells    " No beeps
set nobackup        " No backups
set nowritebackup   "
set noswapfile      " No swapfile
set splitright      " Split vertical windows right to the current windows
set splitbelow      " Split horizontal windows below to the current windows
set encoding=utf-8  " Set default encoding to UTF-8
set autoread        " Automatically reread changed files without asking me anything
set history=50
set ruler
set showcmd
set incsearch
set hlsearch
set ignorecase
set smartcase
set laststatus=2
set nowrap

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Setup bundles
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-unimpaired'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-endwise'

" Colorscheme settings
set background=dark

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

let g:solarized_termcolors=256
colorscheme solarized

" Tab setting
set tabstop=2
set shiftwidth=2
set expandtab

" Line numbers
set number numberwidth=5

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
