Plug g:plug_home.'/eclim', { 'for': 'java' } " Eclim has a special install process. See http://eclim.org/install.html

let g:EclimCompletionMethod = 'omnifunc'
let g:EclimJavascriptValidate = 0
let g:EclimJavascriptLintEnabled = 0

let g:deoplete#omni#functions.java = ['eclim#java#complete#CodeComplete', 'syntaxcomplete#Complete']
