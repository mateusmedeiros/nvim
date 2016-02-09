" ┌───────────────────────────────────┐
" │            functions              │
" └───────────────────────────────────┘

source $HOME/.vim/functions.vim

" ┌───────────────────────────────────┐
" │             vim-plug              │
" └───────────────────────────────────┘

""""" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall
endif


""""" Plug
call plug#begin('~/.vim/plugged')

""""" Plugins
Plug 'vim-scripts/a.vim'
Plug 'Raimondi/delimitMate'
Plug 'Raimondi/vim_search_objects'
Plug 'tmhedberg/matchit'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kana/vim-textobj-user'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'PeterRincker/vim-argumentative'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-endwise'
Plug 'w0ng/vim-hybrid'

" Deferred for manual loading
Plug 'christoomey/vim-tmux-navigator', { 'on': [] }


" Local
Plug g:plug_home.'/eclim' " Eclim has a special install process. See http://eclim.org/install.html


" Only when inside TMUX
call LoadPlugIfExists('vim-tmux-navigator', '$TMUX')


" On :NERDTreeToggle
let g:on_nerd_tree_toggle_command_commands = { 'on':  'NERDTreeTabsToggle' }
Plug 'scrooloose/nerdtree', g:on_nerd_tree_toggle_command_commands
Plug 'jistr/vim-nerdtree-tabs', g:on_nerd_tree_toggle_command_commands
Plug 'kien/ctrlp.vim', g:on_nerd_tree_toggle_command_commands


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
Plug 'vim-utils/vim-ruby-fold', g:on_ruby_rails_filetype_types


" On Clojure filetype
let g:on_clojure_filetype_types = { 'for': 'clojure' }
Plug 'guns/vim-sexp', g:on_clojure_filetype_types
Plug 'tpope/vim-sexp-mappings-for-regular-people', g:on_clojure_filetype_types
Plug 'tpope/vim-classpath', g:on_clojure_filetype_types
Plug 'tpope/vim-fireplace', g:on_clojure_filetype_types
Plug 'tpope/vim-leiningen', g:on_clojure_filetype_types
Plug 'guns/vim-clojure-highlight', g:on_clojure_filetype_types
Plug 'kien/rainbow_parentheses.vim', g:on_clojure_filetype_types


" On Javascript filetype
let g:on_javascript_filetype_types = { 'for': ['javascript'] }
Plug 'othree/yajs.vim', g:on_javascript_filetype_types
Plug 'isRuslan/vim-es6', g:on_javascript_filetype_types


" On Rust filetype
let g:on_rust_filetype_types = { 'for': ['rust'] }
Plug 'racer-rust/vim-racer', g:on_rust_filetype_types
Plug 'rust-lang/rust.vim', g:on_rust_filetype_types


" On Coffeescript filetype
Plug 'kchmck/vim-coffee-script', { 'for' : 'coffee' }


" On SCSS filetype
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }


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
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:ycm_rust_src_path = $RUST_SRC_PATH

""" UltiSnips
source $HOME/.vim/ultisnips_tab_hack.vim

""" Supertab
let g:SuperTabDefaultCompletionType = '<C-n>'

""" Eclim
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimJavascriptValidate = 0

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


" ┌───────────────────────────────────┐
" │             Mappings              │
" └───────────────────────────────────┘

""" Set leader to ,
""" NOTE: Put this before any mapping that uses it, or the mapping will use the old leader
let mapleader=","

""" <leader>r to highlight the current file on NERDTree
map <leader>r :NERDTreeFind<cr>

""" <leader>s to toggle NERDTree
nnoremap <Leader>s :NERDTreeTabsToggle<CR>

""" Clear line (like a dd but without the newline)
nnoremap du g^d$
nnoremap dU g^"_d$

""" Copy whole line but not including any whitespace (which also means no newline)
nnoremap yu m`g^y$``

""" Erase line (like a dd but using the black-hole register)
nnoremap dD "_dd

""" Change del to delete characters without saving in the default register
nnoremap <Del> "_x

""" Navigate through tabs with F9 (left) and F10 (right)
nnoremap <expr> <F9>  bufname("%") != "NERD_tree_1" ? ":bp<CR>" : ":wincmd l<CR>:bp<CR>"
inoremap <expr> <F9>  bufname("%") != "NERD_tree_1" ? ":bp<CR>" : ":wincmd l<CR>:bp<CR>"
nnoremap <expr> <F10> bufname("%") != "NERD_tree_1" ? ":bn<CR>" : ":wincmd l<CR>:bn<CR>"
inoremap <expr> <F10> bufname("%") != "NERD_tree_1" ? ":bn<CR>" : ":wincmd l<CR>:bn<CR>"

""" Select last inserted text (The ĸ character is generated on my keyboard
""" layout/OS when I press 'Alt Gr' + 'K')
nnoremap ĸ <Esc>`[v`]

""" Auto-indent text on paste
nnoremap <C-p> p<Esc>`[v`]=<Esc>
nnoremap <C-P> P<Esc>`[v`]=<Esc>

""" Custom tmux nav hotkeys (needs g:tmux_navigator_no_mappings set to 1)
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
inoremap <silent> <c-h> <Esc>:TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
inoremap <silent> <c-j> <Esc>:TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
inoremap <silent> <c-k> <Esc>:TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
inoremap <silent> <c-l> <Esc>:TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
inoremap <silent> <c-\> <Esc>:TmuxNavigatePrevious<cr>

""" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

""" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


" ┌───────────────────────────────────┐
" │             Commands              │
" └───────────────────────────────────┘

""" Buffer management commands
command -bang B try | bp | sp | bn | bd<bang> | catch /E89:/ | execute "normal! \<c-w>j" | execute "normal! :q\<cr>" | echoerr v:exception | endtry " :B(!) to close a buffer
command Bw bp|sp|bn|w|bd " :Bw to close buffer saving modifications

""" Remove trailing whitespace
command Cut %s/\s\+$//e


" ┌───────────────────────────────────┐
" │          Other settings           │
" └───────────────────────────────────┘

""" Fallbacks for YCM and Eclim configuration
let &omnifunc="syntaxcomplete#Complete#" . &omnifunc
let &omnifunc="eclim#" . &omnifunc

""" Smart indentation and change tabs to spaces
set autoindent
set smartindent
set expandtab
set smarttab

""" Amount of spaces for indentation
set tabstop=3
set softtabstop=3
set shiftwidth=3

""" Search options
:set incsearch " Start searching right away (incremental search, instead of waiting for cr)
:set hlsearch " Highlight search as it goes

""" Line numbers and size used by the column (5 numbers)
set number
set numberwidth=5

""" Enable backup
set backup

""" Enable undo and set options
set undofile
set undolevels=1000
set undoreload=10000

""" Put backups, swaps and undo files on ~/.vim/{backup,swap,undo}
""" Assumes that if only one of the directories doesn't exist, all of them don't (which should be true for 99% of the cases)
if !isdirectory($HOME.'/.vim/backup')
  call mkdir($HOME.'/.vim/backup', "p")
  call mkdir($HOME.'/.vim/swap', "p")
  call mkdir($HOME.'/.vim/undo', "p")
endif
set backupdir=$HOME/.vim/backup//
set directory=$HOME/.vim/swap//
set undodir=$HOME/.vim/undo//

""" Always show statusbar
set laststatus=2

""" Don't try to close a buffer on buffer change (instead hide it)
set hidden

""" Wrap to the other line when moving cursor to the sides (JUDGE ME)
set whichwrap+=<,>,h,l,[,]

""" Set anonymous clipboard to X11's one
set clipboard=unnamedplus

""" Enable syntax highlighting of any kind
syntax enable

""" Set colorscheme if exists
set background=dark
silent! colorscheme hybrid


filetype plugin indent on
