Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" vim-racer
let g:racer_cmd = $HOME.'/.cargo/bin/racer'

" This is used automatically by vim-racer
let $RUST_SRC_PATH="/usr/src/rust/src/"

" This is used by YCM
let g:ycm_rust_src_path = "/usr/src/rust/src/"
