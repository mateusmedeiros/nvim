" ┌───────────────────────────────────┐
" │             NeoBundle             │
" └───────────────────────────────────┘
if has('vim_starting')
  set nocompatible
  set runtimepath+=/home/doodad/.vim/bundle/neobundle.vim/
endif
filetype off
call neobundle#begin(expand('/home/doodad/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

""""" Bundles here:
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Raimondi/vim_search_objects'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'bb:sjl/gundo.vim'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'takac/vim-hardtime'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'slim-template/vim-slim.git'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'ervandew/supertab'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'bling/vim-airline'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'haya14busa/vim-easyoperator-line'
NeoBundle 'haya14busa/vim-easyoperator-phrase'

call neobundle#end()
NeoBundleCheck





" ┌───────────────────────────────────┐
" │          Plugin options           │
" └───────────────────────────────────┘

""""" YCM 
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1

""""" Hardtime
let g:hardtime_default_on = 1 " Always turn hardtime on, on any buffer
let g:hardtime_timeout = 2000 " Cooldown of the forbidden skill
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ] " Turn off hardtime on NERDTree
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 5 " Number of times you can press hjkl before they're disabled

""""" NERDTree / NERDTreeTabs 
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
let g:nerdtree_tabs_focus_on_files = 1 " Change focus to file after open file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if only NERDTree is open
nnoremap <Leader>a :NERDTreeTabsToggle<CR> 

""""" scss-syntax 
autocmd FileType scss set iskeyword+=- " Add "-" to the list of keywords on a scss file for correct highlighting

""""" Airline 
let g:airline_theme = 'powerlineish'
let g:airline_enable_branch = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

""""" CtrlP 
let g:ctrlp_show_hidden = 1
let g:ctrlp_split_window = 0

""""" Gundo 
nnoremap <F5> :GundoToggle<CR> " Set Gundo hotkey

""""" UltiSnips
let g:UltiSnipsExpandTrigger       = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"





" ┌───────────────────────────────────┐
" │          Other settings           │
" └───────────────────────────────────┘

""" Fallback for YCM
set omnifunc=syntaxcomplete#Complete

""" Set anonymous clipboard to X11's one
set clipboard=unnamedplus

""" Smart indentation and change tabs to spaces
set autoindent
set smartindent
set expandtab 
set smarttab

""" Amount of spaces for indentation 
set tabstop=3
set softtabstop=3
set shiftwidth=3

""" :B command to close a buffer
command B bp|sp|bn|bd

""" Line numbers with specified width. Current one is absolute, adjacent ones relative
set relativenumber 
set number
set numberwidth=5

""" Enable backup
set backup

""" Enable undo and set options
set undofile                
set undolevels=1000         
set undoreload=10000

""" Put backups, swaps and undo files on ~/.vim/{backup,swap,undo}
set backupdir=$HOME/.vim/backup//
set directory=$HOME/.vim/swap//
set undodir=$HOME/.vim/undo//

""" \r to highlight the current file on NERDTree
map <leader>r :NERDTreeFind<cr>

""" Always show statusbar
set laststatus=2

""" Set leader to ,
let mapleader=","

""" Enable syntax highlighting of any kind
syntax enable

""" Set colorscheme and etc
colorscheme monokai

""" Tab hack for UltiSnips 
source $HOME/.vim/ultisnips_tab_hack.vim
" see https://github.com/Valloric/YouCompleteMe/issues/36

filetype plugin indent on
