" CoC config
if !has_key(g:plugs, 'vim-fugitive')
    finish
endif

map <Leader>g :Git<Return>
