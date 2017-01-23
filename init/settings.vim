" ┌───────────────────────────────────┐
" │              Settings             │
" └───────────────────────────────────┘

""" Some file watchers go nuts when this is not set to yes
set backupcopy=yes

""" Smart indentation and change tabs to spaces
set autoindent
set smartindent
set expandtab
set smarttab

""" Amount of spaces for indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2

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

""" Put backups, swaps and undo files on ~/.config/nvim/{backup,swap,undo}
""" Assumes that if only one of the directories doesn't exist, all of them don't (which should be true for 99% of the cases)
if !isdirectory($HOME.'/.config/nvim/backup')
  call mkdir($HOME.'/.config/nvim/backup', "p")
  call mkdir($HOME.'/.config/nvim/swap', "p")
  call mkdir($HOME.'/.config/nvim/undo', "p")
endif
set backupdir=$HOME/.config/nvim/backup//
set directory=$HOME/.config/nvim/swap//
set undodir=$HOME/.config/nvim/undo//

""" Always show statusbar
set laststatus=2

""" Don't try to close a buffer on buffer change (instead hide it)
set hidden

""" Split new buffers to the right and bottom halfs of the screen
set splitbelow
set splitright

""" Wrap to the other line when moving cursor to the sides (JUDGE ME)
set whichwrap+=<,>,h,l,[,]

""" Set anonymous clipboard to X11's one
set clipboard=unnamedplus

""" Enable syntax highlighting of any kind
syntax enable
