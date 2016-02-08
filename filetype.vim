if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    autocmd BufRead,BufNewFile *.es6 set filetype=javascript
augroup END
