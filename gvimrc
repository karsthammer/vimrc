if has("gui_macvim")
  "" Remap Command-T to Command-Shift-T
  macmenu &File.New\ Tab key=<D-S-t>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Start without the toolbar
  set guioptions-=T

  set guifont=Monaco:h12.00
endif