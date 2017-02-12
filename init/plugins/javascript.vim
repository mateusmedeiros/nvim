Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
Plug 'othree/jspc.vim', { 'for': 'javascript' }

""" tern_for_vim
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:deoplete#omni#functions.javascript = ['tern#Complete', 'jspc#omni', 'javascriptcomplete#CompleteJS', 'syntaxcomplete#Complete']
let g:deoplete#sources.javascript = ['ternjs'] + g:deoplete#sources._
let g:deoplete#member#prefix_patterns.javascript = ['\.']
