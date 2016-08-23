if has('nvim')
  runtime! plugin/python_setup.vim
endif

let $NEOVIM=1

source $HOME/.config/nvim/init/functions.vim
source $HOME/.config/nvim/init/plugins.vim
source $HOME/.config/nvim/init/mappings.vim
source $HOME/.config/nvim/init/commands.vim
source $HOME/.config/nvim/init/settings.vim
source $HOME/.config/nvim/init/appearance.vim

if exists('g:nyaovim_version')
  source $HOME/.config/nvim/init/nyaovim.vim
endif

filetype plugin indent on
