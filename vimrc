"" Call pathogen
call pathogen#infect()

"" Basic
set nocompatible
set number
set ruler
set encoding=utf-8

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

"" Enable syntax highlighting
syntax on
filetype plugin indent on
set background=dark

" Solarized options
let g:solarized_hitrail=1 " Highlight trailing spaces
let g:solarized_menu=0 " Don't display the solarized menu
if !has("gui_running")
  " let g:solarized_termtrans=2 " Force black background in terminal
endif
colorscheme solarized
set list
set listchars=tab:▸\ ,eol:¬

"" Tab settings
set nowrap
set ts=2 sw=2 sts=2 noexpandtab " Default: use tabs
autocmd User Rails setlocal ai noexpandtab
autocmd User Rails/*/*.yml setlocal ai expandtab

"" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

"" Wild settings
  " Disable output and VCS files
  set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

  " Disable archive files
  set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

  " Ignore bundler and sass cache
  set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

  " Ignore logs & tmp
  set wildignore+=*/tmp/*,*/log/*

  " Disable temp and backup files
  set wildignore+=*.swp,*~,._*

"" Mappings
if has("gui_macvim") && has("gui_running")
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  nmap <C-k> [e
  nmap <C-j> ]e

  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
  vmap <C-k> [egv
  vmap <C-j> ]egv

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i
 
  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  nmap <C-k> [e
  nmap <C-j> ]e

  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
  vmap <C-k> [egv
  vmap <C-j> ]egv

  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt
endif

"" GUI settings
if has("gui_running")
  " set clipboard=unnamed " use os x clipboard for yanking

  if has("autocmd")
    " Automatically resize splits when resizing MacVim window
    autocmd VimResized * wincmd =
  endif
endif

"" Statusline
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endif

"" Autosave on blur
au FocusLost * silent! wall

"" NERDCommenter mappings
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <ESC><plug>NERDCommenterToggle<CR>i

"" CTRL-P settings & mappings
let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\tmp\.$\|\log$\|\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-e>'],
  \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>', '<c-t>'],
  \ }

map <D-t> :CtrlP<CR>
imap <D-t> <ESC>:CtrlP<CR>

"" ACK mappings
map <D-F> :Ack<space>

"" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0
let g:syntastic_auto_loc_list=2
let g:syntastic_ruby_exec='/Users/khammer/.rvm/rubies/ruby-1.9.3-p374/bin/ruby'
