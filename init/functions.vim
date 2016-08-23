function LoadPlugIfExists(plug, exists)
    if exists(a:exists)
        call plug#load(a:plug)
    endif
endfunction
