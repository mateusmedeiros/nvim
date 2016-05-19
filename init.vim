if has('nvim')
  runtime! plugin/python_setup.vim
endif

source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/settings.vim

if has('gui_running')
  source $HOME/.config/nvim/gvim.vim
endif

filetype plugin indent on
