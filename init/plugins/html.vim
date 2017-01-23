let on_html_related_filetype_types = { 'for': ['html', 'xhtml', 'slim', 'eruby', 'htmldjango', 'jsp', 'jsf', 'javascript'] }
Plug 'mattn/emmet-vim', on_html_related_filetype_types
Plug 'Valloric/MatchTagAlways', on_html_related_filetype_types

" ┌───────────────────────────────────┐
" │          Plugin options           │
" └───────────────────────────────────┘

imap <expr> <C-M> emmet#expandAbbrIntelligent("\<C-M>")
