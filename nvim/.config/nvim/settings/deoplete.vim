" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('ale', 'rank', 999)
call deoplete#custom#source('ultisnips', 'rank', 1000)
