" ┌───────────────────────────────────┐
" │              vim-plug             │
" └───────────────────────────────────┘

""""" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall
endif

""""" Plug
call plug#begin('~/.config/nvim/plugged')

""""" Plugins
Plug 'vim-scripts/a.vim'
Plug 'Raimondi/delimitMate' " See also: init/plugins/clojure.vim
Plug 'Raimondi/vim_search_objects'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kana/vim-textobj-user'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'PeterRincker/vim-argumentative'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim'
" Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'neomake/neomake'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-endwise'
Plug 'w0ng/vim-hybrid'
Plug 'ctrlpvim/ctrlp.vim'

" On :NERDTreeToggle
Plug 'brookhong/nerdtree', { 'on': 'NERDTreeTabsToggle' }
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }

source $HOME/.config/nvim/init/plugins/slim.vim
source $HOME/.config/nvim/init/plugins/html.vim
source $HOME/.config/nvim/init/plugins/rails.vim
source $HOME/.config/nvim/init/plugins/clojure.vim
source $HOME/.config/nvim/init/plugins/javascript.vim
source $HOME/.config/nvim/init/plugins/rust.vim
source $HOME/.config/nvim/init/plugins/coffee.vim
source $HOME/.config/nvim/init/plugins/scss.vim
source $HOME/.config/nvim/init/plugins/java.vim

if exists('g:nyaovim_version')
  source $HOME/.config/nvim/init/plugins/nyaovim.vim
endif

source $HOME/.config/nvim/init/plugins/tmux.vim

call plug#end()


" ┌───────────────────────────────────┐
" │          Plugin options           │
" └───────────────────────────────────┘

let g:deoplete#enable_at_startup = 1

""" Important note: Some plugins are configured in special ways so that they can
""" behave with each other, so be extra careful when changing these. They are:
"""  - YCM
"""  - Ultisnips
"""  - Supertab (it's included so that YCM and ultisnips work fine with tab)
"""  - Eclim

""" YCM
" There is also YCM config in the following files: 
"  - init/plugins/rust.vim
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']

""" UltiSnips
source $HOME/.config/nvim/other/ultisnips_tab_hack.vim

""" Supertab
let g:SuperTabDefaultCompletionType = '<C-n>'

""" NERDTree / NERDTreeTabs
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
let g:nerdtree_tabs_focus_on_files = 1 " Change focus to file after open file
let g:nerdtree_tabs_autofind = 0  " Always keep NERDTree in sync with the current file
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if only NERDTree is open


""" Airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

""" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_split_window = 0
let g:ctrlp_custom_ignore = { 'dir': 'node_modules' }

""" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

""" Neomake
let is_executable = 'executable(v:val)'
let g:neomake_css_enabled_makers = filter(['csslint'], is_executable)
let g:neomake_javascript_enabled_makers = filter(['eslint_d'], is_executable)
let g:neomake_json_enabled_makers = filter(['jsonlint'], is_executable)
let g:neomake_ruby_enabled_makers = filter(['rubocop'], is_executable)
let g:neomake_scss_enabled_makers = executable("scss-lint") ? ['scsslint'] : []
let g:neomake_yaml_enabled_makers = filter(['yamllint'], is_executable)
let g:neomake_list_height = 5
autocmd! BufWritePost * Neomake


" ┌───────────────────────────────────┐
" │              omnifunc             │
" └───────────────────────────────────┘

""" YCM
let &omnifunc="syntaxcomplete#Complete#" . &omnifunc

""" Eclim
let &omnifunc="eclim#" . &omnifunc
