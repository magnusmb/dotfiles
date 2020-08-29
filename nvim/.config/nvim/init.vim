"        _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / | | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"

" nVim settings
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call has('python3')
" vim-plug script begin

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Maude
Plug 'ReedOei/vim-maude'

" Commenting
Plug 'tomtom/tcomment_vim'

" Smarter movement
Plug 'wellle/targets.vim'
Plug 'machakann/vim-swap'
Plug 'bkad/CamelCaseMotion'
Plug 'adelarsq/vim-matchit'
Plug 'xolox/vim-misc'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Shougo/deoplete.nvim'
" Plug 'deoplete-plugins/deoplete-tag'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'artur-shaik/vim-javacomplete2'

" Syntax checking
Plug 'neomake/neomake'
Plug 'dense-analysis/ale'

" Typescript and React
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

" HTML
Plug 'mattn/emmet-vim'

" Elm
Plug 'andys8/vim-elm-syntax'

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

call plug#end()              " required
filetype plugin indent on    " required


"   "  __  __ _            _         _   _ _ _ _
"   " |  \/  (_)_ _  ___  (_)_ _  __| |_(_| | (_)_ _  __ _ ___ _ _
"   " | |\/| | | ' \/ -_) | | ' \(_-|  _| | | | | ' \/ _` / -_| '_|
"   " |_|  |_|_|_||_\___| |_|_||_/__/\__|_|_|_|_|_||_\__, \___|_|
"   "                                                   |___/

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
    colorscheme base16-materia
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
    let mapleader = " "
    nnoremap <Space> <Nop>

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
    map <Leader>q :q<Return>
    map <Leader>Q :qa<Return>
    map <Leader>p :put+<Return>
    map <Leader>y "+y<Return>
    map <Leader>Y :%y+<Return>
    " noremap <Leader>| :tabnew ~/.vimrc<Return>
    map <Leader>§ :so ~/.vimrc<Return>
    map <Leader>e :Explore<Return>

    " Search and replace word under cursor
    nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

    " Neovim terminal Escape-key fix
    nnoremap <C-t> <C-]>
    nnoremap <M-t> <C-t>
    tnoremap <Esc> <C-\><C-n>

    " Navigating with guides
    vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
    map <Space><Tab> <Esc>/<++><Enter>"_c4l
    nmap <Leader>c :SyntasticCheck<Return>



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
    let g:easytags_async=1
    let g:easytags_always_enabled=1



" Deoplete
    " let g:deoplete#enable_at_startup = 1
    " call deoplete#custom#source('ale', 'rank', 999)
    " call deoplete#custom#source('ultisnips', 'rank', 1000)



" Ale
    let g:ale_fixers = {
                \'javascript': ['prettier', 'eslint'],
                \'typescript': ['prettier', 'tslint'],
                \'typescriptreact': ['prettier', 'tslint'],
                \'javascriptreact': ['prettier', 'eslint'],
                \'css': ['prettier', 'eslint'],
                \'scss': ['prettier', 'eslint'],
                \'elm': ['elm-format']
                \}
    let g:ale_fix_on_save = 1
    let g:airline#extensions#ale#enabled = 1
    " let g:ale_completion_enabled = 0



" UltiSnip settings
    " Trigger configuration. Do not use <tab> if you use
    " https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsListSnippets="<c-Tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    let g:UltiSnipsEditSplit="vertical"
    let g:ultisnips_java_brace_style="nl"
    let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips", "UltiSnips"]



" CoC config
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " TextEdit might fail if hidden is not set.
    set hidden

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Give more space for displaying messages.
    set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
      " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
    else
      set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    " inoremap <silent><expr> <TAB>
    "       \ pumvisible() ? "\<C-n>" :
    "       \ <SID>check_back_space() ? "\<TAB>" :
    "       \ coc#refresh()
    " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    "
    " function! s:check_back_space() abort
    "   let col = col('.') - 1
    "   return !col || getline('.')[col - 1]  =~# '\s'
    " endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif


    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Format Java files on save
    autocmd BufWritePre *.java silent call CocAction('format')

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

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction
