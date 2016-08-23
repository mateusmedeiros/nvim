" ┌───────────────────────────────────┐
" │             Commands              │
" └───────────────────────────────────┘

""" Buffer management commands
command -bang B try | bp | sp | bn | bd<bang> | catch /E89:/ | execute "normal! \<c-w>j" | execute "normal! :q\<cr>" | echoerr v:exception | endtry " :B(!) to close a buffer
command Bw bp|sp|bn|w|bd " :Bw to close buffer saving modifications

""" Remove trailing whitespace
command Cut %s/\s\+$//e
