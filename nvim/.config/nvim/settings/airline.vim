if !has_key(g:plugs, 'airline') || !has_key(g:plugs, 'ale')
    finish
endif

let g:airline#extensions#ale#enabled = 1
