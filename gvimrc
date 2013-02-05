if has("gui_macvim")
  "" Remap Command-T to Command-Shift-T
  macmenu &File.New\ Tab key=<D-S-t>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Start without the toolbar
  set guioptions-=T

  set guifont=Monaco:h12.00

  macm File.Close key=<nop>
  nnoremap <silent> <D-w> :bd<CR>
  inoremap <silent> <D-w> <Esc>:bd<CR>
  vnoremap <silent> <D-w> <Esc>:bd<CR>
endif
