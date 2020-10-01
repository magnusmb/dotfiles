" vim-plug script begin

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Commenting
Plug 'tomtom/tcomment_vim'

" Smarter movement
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'machakann/vim-swap'
Plug 'bkad/CamelCaseMotion'
Plug 'adelarsq/vim-matchit'
Plug 'xolox/vim-misc'

" Git
Plug 'tpope/vim-fugitive'

" File explorer
Plug 'preservim/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle'] }

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'Shougo/deoplete.nvim'
" Plug 'deoplete-plugins/deoplete-tag'
" source ~/.config/nvim/settings/settings/deoplete.vim

Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'

Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

" Syntax checking
Plug 'neomake/neomake'
Plug 'dense-analysis/ale', { 'for': 'haskell' }

" Typescript and React
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascriptreact', 'typescriptreact'] }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescriptreact'] }

" HTML
Plug 'mattn/emmet-vim'

" Elm
Plug 'andys8/vim-elm-syntax', { 'for': 'elm' }

" Maude
Plug 'ReedOei/vim-maude', { 'for': 'maude' }

" Themes
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

call plug#end()              " required
filetype plugin indent on    " required

source ~/.config/nvim/settings/ultisnips.vim
source ~/.config/nvim/settings/coc.vim
source ~/.config/nvim/settings/ale.vim
source ~/.config/nvim/settings/airline.vim
source ~/.config/nvim/settings/fzf.vim
source ~/.config/nvim/settings/fugitive.vim
