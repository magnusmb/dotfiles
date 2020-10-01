" Ale
if !has_key(g:plugs, 'ale')
    finish
endif

let g:ale_fixers = {
    \'javascript': ['prettier', 'eslint'],
    \'typescript': ['prettier', 'tslint'],
    \'typescriptreact': ['prettier', 'tslint'],
    \'javascriptreact': ['prettier', 'eslint'],
    \'css': ['prettier', 'eslint'],
    \'scss': ['prettier', 'eslint'],
    \'elm': ['elm-format'],
    \'haskell': ['stylish-haskell']
    \}
let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 0
