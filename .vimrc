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
Plug 'jlanzarotta/bufexplorer'
Plug 'Raimondi/delimitMate'
Plug 'Raimondi/vim_search_objects'
Plug 'tmhedberg/matchit'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'cakebaker/scss-syntax.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'slim-template/vim-slim'
Plug 'kana/vim-textobj-user'
Plug 'bling/vim-airline'
Plug 'sickill/vim-monokai'
Plug 'Lokaltog/vim-easymotion'
Plug 'kchmck/vim-coffee-script'
Plug 'PeterRincker/vim-argumentative'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/syntastic'

" Local
Plug g:plug_home.'/eclim' " Eclim has a special install process. See http://eclim.org/install.html


" On :MERDTreeToggle
let g:on_nerd_tree_toggle_command_commands = { 'on':  'NERDTreeTabsToggle' }
Plug 'scrooloose/nerdtree', g:on_nerd_tree_toggle_command_commands
Plug 'jistr/vim-nerdtree-tabs', g:on_nerd_tree_toggle_command_commands
Plug 'kien/ctrlp.vim', g:on_nerd_tree_toggle_command_commands


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
let g:on_clojure_filetype_types = { 'for': 'clojure' }
Plug 'guns/vim-sexp', g:on_clojure_filetype_types
Plug 'tpope/vim-sexp-mappings-for-regular-people', g:on_clojure_filetype_types
Plug 'tpope/vim-classpath', g:on_clojure_filetype_types
Plug 'tpope/vim-fireplace', g:on_clojure_filetype_types
Plug 'tpope/vim-leiningen', g:on_clojure_filetype_types
Plug 'guns/vim-clojure-highlight', g:on_clojure_filetype_types
Plug 'kien/rainbow_parentheses.vim', g:on_clojure_filetype_types


call plug#end()




" ┌───────────────────────────────────┐
" │          Plugin options           │
" └───────────────────────────────────┘

""" YCM
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
augroup load_ycm
   autocmd!
   autocmd InsertEnter * call youcompleteme#Enable() | autocmd! load_ycm
augroup END

""" Eclim
let g:EclimCompletionMethod = 'omnifunc'

""" NERDTree / NERDTreeTabs
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
let g:nerdtree_tabs_focus_on_files = 1 " Change focus to file after open file
let g:nerdtree_tabs_autofind = 1  " Always keep NERDTree in sync with the current file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if only NERDTree is open
nnoremap <Leader>a :NERDTreeTabsToggle<CR>

""" scss-syntax
autocmd FileType scss set iskeyword+=- " Add "-" to the list of keywords on a scss file for correct highlighting

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

""" UltiSnips
let g:UltiSnipsExpandTrigger       = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
augroup load_us
  autocmd!
" Tab hack for UltiSnips
  autocmd InsertEnter * source $HOME/.vim/ultisnips_tab_hack.vim
" see https://github.com/Valloric/YouCompleteMe/issues/36
 \| autocmd! load_us
augroup END

""" Delimitmate
au FileType clojure let b:delimitMate_quotes = "\""

""" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>




""" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

""" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


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

""" \r to highlight the current file on NERDTree
map <leader>r :NERDTreeFind<cr>

""" Always show statusbar
set laststatus=2

""" Don't try to close a buffer on buffer change (instead hide it)
set hidden

""" Clear line (like a dd but without the newline)
nnoremap du g^d$
nnoremap dU g^"_d$

""" Copy whole line but not including any whitespace (which also means no newline)
nnoremap yu m`g^y$``

""" Buffer management commands
command -bang B try | bp | sp | bn | bd<bang> | catch /E89:/ | execute "normal! \<c-w>j" | execute "normal! :q\<cr>" | echoerr v:exception | endtry " :B(!) to close a buffer
command Bw bp|sp|bn|w|bd " :Bw to close buffer saving modifications
nnoremap <F9> <Esc>:bp<cr>
inoremap <F9> <Esc>:bp<cr>
nnoremap <F10> <Esc>:bn<cr>
inoremap <F10> <Esc>:bn<cr>

""" Select last inserted text (The ĸ character is generated on my keyboard
""" layout/OS when I press 'Alt Gr' + 'K')
nnoremap ĸ <Esc>`[v`]

""" Auto-indent text on paste
nnoremap <C-p> p<Esc>`[v`]=<Esc>
nnoremap <C-P> P<Esc>`[v`]=<Esc>

""" Remove trailing whitespace
command Cut %s/\s\+$

""" Try to minimize cursor changing at insert mode exit
autocmd InsertLeave * :normal `^

""" Wrap to the other line when moving cursor to the sides (JUDGE ME)
set whichwrap+=<,>,h,l,[,]

""" Set leader to ,
let mapleader=","

""" Set anonymous clipboard to X11's one
set clipboard=unnamedplus

""" Enable syntax highlighting of any kind
syntax enable

""" Set colorscheme if exists
silent! colorscheme monokai


filetype plugin indent on
