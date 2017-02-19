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
Plug 'Shougo/neosnippet.vim' | Plug 'honza/vim-snippets' | Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deoplete.nvim'
Plug 'neomake/neomake'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-endwise'
Plug 'w0ng/vim-hybrid'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'embear/vim-localvimrc'

" Defaults in case they're used by technology-specific configuration
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions._ = ['syntaxcomplete#Complete']
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'member', 'omni', 'neosnippet']
let g:deoplete#member#prefix_patterns = {}
source $HOME/.config/nvim/init/plugins/clojure.vim
source $HOME/.config/nvim/init/plugins/coffee.vim
source $HOME/.config/nvim/init/plugins/elixir.vim
source $HOME/.config/nvim/init/plugins/html.vim
source $HOME/.config/nvim/init/plugins/java.vim
source $HOME/.config/nvim/init/plugins/javascript.vim
source $HOME/.config/nvim/init/plugins/rails.vim
source $HOME/.config/nvim/init/plugins/rust.vim
source $HOME/.config/nvim/init/plugins/scss.vim
source $HOME/.config/nvim/init/plugins/slim.vim
source $HOME/.config/nvim/init/plugins/stylesheets.vim
source $HOME/.config/nvim/init/plugins/tmux.vim

call plug#end()


" ┌───────────────────────────────────┐
" │          Plugin options           │
" └───────────────────────────────────┘

""" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'
let g:deoplete#auto_completion_start_length = 0
let g:min_pattern_length = 0
let g:deoplete#tag#cache_limit_size = 5000000
let g:deoplete#member#prefix_patterns = get(g:, 'deoplete#member#prefix_patterns', {})
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#snippets_directory = [ $HOME . '/.config/nvim/plugged/vim-snippets/snippets', $HOME . '/.config/nvim/snippets' ]
let g:neosnippet#enable_snipmate_compatibility = 1

""" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
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

""" vim-localvimrc
let g:localvimrc_persistent = 2
let g:localvimrc_persistence_file = $HOME . '/.config/nvim/localvimrc_persistence'

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
