function LoadPlugIfExists(plug, exists)
   for var in a:exists
      if exists(var)
         call plug#load(a:plug)
         return
      endif
   endfor
endfunction
