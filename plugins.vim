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
Plug 'Raimondi/delimitMate'
Plug 'Raimondi/vim_search_objects'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kana/vim-textobj-user'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'PeterRincker/vim-argumentative'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'neomake/neomake'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-endwise'
Plug 'w0ng/vim-hybrid'
Plug 'Chiel92/vim-autoformat'

" On :NERDTreeToggle
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'kien/ctrlp.vim', { 'on': 'NERDTreeTabsToggle' }

" On slim filetype
Plug 'slim-template/vim-slim', { 'for': 'slim' }

" On html-related filetype
let g:on_html_related_filetype_types = { 'for': ['html', 'xhtml', 'slim', 'eruby', 'htmldjango', 'jsp', 'jsf'] }
Plug 'mattn/emmet-vim', g:on_html_related_filetype_types
Plug 'Valloric/MatchTagAlways', g:on_html_related_filetype_types

" On Ruby/Rails filetype
let g:on_ruby_rails_filetype_types = { 'for': ['ruby', 'eruby', 'yaml', 'html', 'slim', 'haml', 'rspec'] }
Plug 'tpope/vim-bundler', g:on_ruby_rails_filetype_types
Plug 'tpope/vim-rails', g:on_ruby_rails_filetype_types
Plug 'tpope/vim-rake', g:on_ruby_rails_filetype_types
Plug 'thoughtbot/vim-rspec', g:on_ruby_rails_filetype_types
Plug 'nelstrom/vim-textobj-rubyblock', g:on_ruby_rails_filetype_types

" On Clojure filetype
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure' }

" On Javascript filetype
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }

" On Rust filetype
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" On Coffeescript filetype
Plug 'kchmck/vim-coffee-script', { 'for' : 'coffee' }

" On SCSS filetype
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

""" Local
Plug g:plug_home.'/eclim', { 'for': 'java' } " Eclim has a special install process. See http://eclim.org/install.html
"""

""" Deferred for manual loading

" Only when inside TMUX
Plug 'christoomey/vim-tmux-navigator', { 'on': [] }
call LoadPlugIfExists('vim-tmux-navigator', '$TMUX')
"""

call plug#end()


" ┌───────────────────────────────────┐
" │         Special env vars          │
" └───────────────────────────────────┘

" This is reused to set g:ycm_rust_src_path, but it is NOT used only there
" vim-racer uses it automatically, so it needs to be defined like this
let $RUST_SRC_PATH="/usr/src/rust/src/"


" ┌───────────────────────────────────┐
" │          Plugin options           │
" └───────────────────────────────────┘

""" Important note: Some plugins are configured in special ways so that they can
""" behave with each other, so be extra careful when changing these. They are:
"""  - YCM
"""  - Ultisnips
"""  - Supertab (it's included so that YCM and ultisnips work fine with tab)
"""  - Eclim

""" YCM
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:ycm_rust_src_path = $RUST_SRC_PATH
let &omnifunc="syntaxcomplete#Complete#" . &omnifunc

""" UltiSnips
source $HOME/.config/nvim/ultisnips_tab_hack.vim

""" Supertab
let g:SuperTabDefaultCompletionType = '<C-n>'

""" Eclim
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimJavascriptValidate = 0
let g:EclimJavascriptLintEnabled = 0
let &omnifunc="eclim#" . &omnifunc

""" NERDTree / NERDTreeTabs
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
let g:nerdtree_tabs_focus_on_files = 1 " Change focus to file after open file
let g:nerdtree_tabs_autofind = 1  " Always keep NERDTree in sync with the current file
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if only NERDTree is open

""" scss-syntax
autocmd FileType scss set iskeyword+=- " Add "-" to the list of keywords on a scss file for correct highlighting

""" Airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

""" vim-racer
let g:racer_cmd = $HOME.'/.cargo/bin/racer'

""" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_split_window = 0

""" Delimitmate
au FileType clojure let b:delimitMate_quotes = "\""

""" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

""" Neomake
let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_ruby_enabled_makers = ['rubocop']
autocmd! BufWritePost * Neomake
