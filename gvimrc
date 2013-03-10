" If we have MacVim running, set some stuff
if has("gui_macvim")
  " Map CtrlP to Command-T
  map <D-t> :CtrlP<CR>
  imap <D-t> <ESC>:CtrlP<CR>
  vmap <D-t> <ESC>:CtrlP<CR>

  " Remap Command-T to Command-Shift-T
  macmenu &File.New\ Tab key=<D-S-t>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
endif
