" UltiSnip settings
if !has_key(g:plugs, 'ultisnips')
    finish
endif

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsListSnippets="<c-Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips", "UltiSnips"]
let g:ultisnips_java_brace_style="nl"
