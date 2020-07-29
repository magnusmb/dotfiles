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
"
" C-tags
Plug 'xolox/vim-misc'
Plug 'adelarsq/vim-matchit'

" Smarter movement
Plug 'wellle/targets.vim'
Plug 'machakann/vim-swap'
Plug 'bkad/CamelCaseMotion'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-tag'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'artur-shaik/vim-javacomplete2'

" Syntax checking
Plug 'neomake/neomake'
Plug 'dense-analysis/ale'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" React
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
    " map <silent><C-L> :+tabmove<Return> " Ctrl + Shift not recognized
    " map <silent><C-H> :-tabmove<Return>

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
    let g:deoplete#enable_at_startup = 1
    call deoplete#custom#source('ale', 'rank', 999)
    call deoplete#custom#source('ultisnips', 'rank', 1000)



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
