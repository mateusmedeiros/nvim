let elixir_types = { 'for': ['elixir'] }
Plug 'elixir-lang/vim-elixir', elixir_types
Plug 'slashmili/alchemist.vim', elixir_types


let g:deoplete#sources.elixir = ['alchemist', 'buffer', 'member', 'neosnippet']
