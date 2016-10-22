Plug 'christoomey/vim-tmux-navigator', { 'on': [] }

" The autocmd on VimEnter is necessary because the plugin that neovim-qt uses
" that sets the g:GuiLoaded var will only run after this
augroup load_tmux_navigator
   autocmd!
   autocmd VimEnter * call LoadPlugIfExists('vim-tmux-navigator', ['$TMUX', 'g:GuiLoaded'])
augroup END
