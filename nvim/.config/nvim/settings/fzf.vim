" CoC config
if !has_key(g:plugs, 'fzf') || !has_key(g:plugs, 'fzf.vim')
    finish
endif

" GoTo code navigation.
nmap <silent> <leader>s :GFiles<CR>
nmap <silent> <leader>b :Buffers<CR>
