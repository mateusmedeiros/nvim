" ┌───────────────────────────────────┐
" │          gvim overrides           │
" └───────────────────────────────────┘

""" Initialize gui
gui

""" set colorscheme to solarized
set background=dark
silent! colorscheme solarized

""" try to make gvim fullscreen with the help of wmctrl and vim-fullscreen
silent! FullscreenToggle

""" open NERDTree automatically if the cwd is not the home directory
if getcwd() != $HOME
  NERDTreeTabsToggle
endif
