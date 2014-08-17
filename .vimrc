set nocompatible

execute pathogen#infect()
execute pathogen#helptags()

set omnifunc=syntaxcomplete#Complete
set clipboard=unnamedplus
set autoindent  " Automatically set the indent of a new line (local to buffer).
set smartindent
set tabstop=2  " Tab size eql 4 spaces.
set softtabstop=2
set shiftwidth=2  " Default shift width for indents.
set expandtab  " Replace tabs with ${tabstop} spaces.
set smarttab
":highlight Pmenu ctermbg=238 gui=bold
syntax enable

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
command B bp|sp|bn|bd

"set autochdir
set relativenumber 
set number
set numberwidth=5
set noswapfile
"set background=dark

"colorscheme solarized


set undofile                " Save undo's after file closes
set undodir=$HOME/.vim-undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000


let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"imap <C-K> <esc>a<Plug>snipMateNextOrTrigger
"smap <C-K> <Plug>snipMateNextOrTrigger
"imap <C-J> <esc>a<Plug>snipMateBack
"smap <C-J> <Plug>snipMateBack
map <leader>r :NERDTreeFind<cr>

au BufNewFile *.rb 0r ~/.vim/boilerplate/rb

"let g:nerdtree_tabs_open_on_console_startup = 1
let g:ctrlp_show_hidden=1
let NERDTreeShowHidden=1
let NERDTreeChDirMode=2

nnoremap <F5> :GundoToggle<CR>
"nnoremap <Space> i_<Esc>r
nnoremap <C-@> a_<Esc>r
nnoremap <C-S-"> :bp<CR>
nnoremap " :bn<CR>

if has("gui_running")
  nnoremap p a<C-S-V><Esc>
  vnoremap p <Del>i<C-S-v><Esc>
endif
"map <lt>m <Leader><Leader>ev??<CR> 

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

noremap h <NOP>
""noremap j <NOP>
"noremap k <NOP>
noremap l <NOP>


"autocmd FileType javascript set omnifunc=tern#Complete
"set omnifunc=youcompleteme#Complete

"set rtp+=$HOME/.vim/bundle/powerline/powerline/bindings/vim
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""


"let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"


syntax on
filetype plugin indent on

colorscheme solarized
set background=dark
let g:solarized_termcolors=256
let g:indent_guides_auto_colors=0
let g:solarized_termtrans=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray   ctermbg=11
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray ctermbg=8
"hi Normal guibg=NONE ctermbg=NONE
