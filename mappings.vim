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
