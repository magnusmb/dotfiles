"        _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / | | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"

" nVim settings
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
let &packpath = &runtimepath

let mapleader = " "
nnoremap <Space> <Nop>

call has('python3')

source ~/.config/nvim/plugins.vim

"  __  __ _            _         _   _ _ _ _
" |  \/  (_)_ _  ___  (_)_ _  __| |_(_| | (_)_ _  __ _ ___ _ _
" | |\/| | | ' \/ -_) | | ' \(_-|  _| | | | | ' \/ _` / -_| '_|
" |_|  |_|_|_||_\___| |_|_||_/__/\__|_|_|_|_|_||_\__, \___|_|
"                                                   |___/

" Some basics:
    set nocompatible
    filetype plugin on
    syntax on
    set encoding=utf-8
    set number relativenumber
    set background=dark
    set hlsearch
    set visualbell
    set scrolloff=5
    set mouse=a
    set autochdir

" Coding setup
    set tabstop=8
    set expandtab
    set shiftwidth=4
    set autoindent
    set smartindent
    set colorcolumn=70
    set completeopt-=preview

" Theme
    set lazyredraw
    silent! colorscheme base16-materia
    let g:rehash256 = 1
    set t_Co=256

    " Enable true color
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
    endif

    if has("gui_running")
      set lines=60 columns=90
      " set guioptions-=m
      set guioptions-=T
      set guioptions-=r
      set guioptions-=L
      set backspace=2
      if has("x11")
        set guifont=DejaVu\ Sans\ Mono\ 11
      else
        set guifont=DejaVu_Sans_Mono:h11:cANSI:qDRAFT
      endif
    endif

" Enable autocompletion:
    set wildmode=longest,list,full

" Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
    set splitbelow splitright

" Automatically deletes all tralling whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e

" Remaps

    " Shortcutting split navigation, saving a keypress:
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

    " Tabs
    nmap <silent>L :tabnext<Return>
    nmap <silent>H :tabprevious<Return>
    map <Leader>t :tabnew<Return>

    nmap <silent><Esc> :noh<Return>
    map <Leader>Q :qa<Return>
    map <Leader>p :put+<Return>
    map <Leader>y "+y<Return>
    map <Leader>Y :%y+<Return>
    map <Leader>§ :so ~/.vimrc<Return>
    map <Leader>e :NERDTree<Return>

    " Search and replace word under cursor
    nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

    " " Neovim terminal Escape-key fix
    " nnoremap <C-t> <C-]>
    " nnoremap <M-t> <C-t>
    " tnoremap <Esc> <C-\><C-n>

if has_key(g:plugs, 'coc.nvim')
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Symbol renaming.
    nmap <leader>qr <Plug>(coc-rename)

    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Show documentation in preview window
    nnoremap <silent> <leader>qd :call <SID>show_documentation()<CR>

    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif
endif

" Netrw settings
    let g:netrw_banner = 0
    let g:netrw_liststyle = 3 " Tree view

" Elm settings
    " LanguageServer
    let g:LanguageClient_serverCommands = {
        \ 'elm': ['elm-language-server', '--stdio'],
        \ }

    let g:LanguageClient_rootMarkers = {
        \ 'elm': ['elm.json'],
        \ }

" Javascript and Typescript settings
    au Filetype javascript,typescript,*react set shiftwidth=2
    au Filetype javascriptreact call UltiSnips#AddFiletypes('javascript')
    au Filetype typescriptreact call UltiSnips#AddFiletypes('typescript')

" Maude setttings
    au BufNewFile,BufRead *.maude setfiletype maude

" Custom 'snippets'
    autocmd Filetype java,c inoremap <M-CR> <CR>{<CR>}<Esc>O
    autocmd Filetype javascript inoremap <M-CR> {<CR>}<Esc>O

" JavaComplete2 settings
    autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Easytags
    " let g:easytags_async=1
    " let g:easytags_always_enabled=1
