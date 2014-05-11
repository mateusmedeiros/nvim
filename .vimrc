set nocompatible

execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on

"set rtp+=$HOME/.vim/bundle/powerline/powerline/bindings/vim

set clipboard=unnamedplus
set autoindent  " Automatically set the indent of a new line (local to buffer).
set smartindent
set tabstop=2  " Tab size eql 4 spaces.
set softtabstop=2
set shiftwidth=2  " Default shift width for indents.
set expandtab  " Replace tabs with ${tabstop} spaces.
set smarttab

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
command B bp|sp|bn|bd

"set autochdir
set relativenumber 
set number
set numberwidth=5
set noswapfile
"set background=dark

"colorscheme solarized


let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

au BufNewFile *.rb 0r ~/.vim/boilerplate/rb

"let g:nerdtree_tabs_open_on_console_startup = 1
let g:ctrlp_show_hidden=1
let NERDTreeShowHidden=1
let NERDTreeChDirMode=2

nnoremap <F5> :GundoToggle<CR>
nnoremap <Space> i_<Esc>r
nnoremap <C-@> a_<Esc>r
nnoremap <S-Tab> :bp<CR>
nnoremap <Tab> :bn<CR>

if has("gui_running")
  nnoremap p a<C-S-V><Esc>
  vnoremap p <Del>i<C-S-v><Esc>
endif
"map <lt>m <Leader><Leader>ev??<CR> 

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

noremap h <NOP>
""noremap j <NOP>
"noremap k <NOP>
noremap l <NOP>


