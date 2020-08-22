let mapleader=" "

" Basic stuff
set mouse=a
set nocompatible
set nohlsearch
filetype plugin on
syntax on
set encoding=utf-8
set number
set termguicolors

" Enable spell checking, s for spell check
map <leader>se :setlocal spell! spelllang=en<CR>
map <leader>sr :setlocal spell! spelllang=ro<CR>

" Easier Write and Quit aliases
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :wq<CR>
nnoremap <leader>w :w<CR>

" ###
" # Plugins
" ###
call plug#begin('~/.local/share/nvim/plugged')

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

call plug#end()

" hexokinase
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_highlighters = ['backgroundfull']

autocmd VimEnter * HexokinaseTurnOn


" ###
" # Key Remapping
" ###

map <C-s> :source ~/.config/nvim/init.vim<CR>
