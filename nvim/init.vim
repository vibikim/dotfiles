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
set splitbelow splitright

set cursorline

" restore cursor to the last position after reopening a file
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

" Enable spell checking, s for spell check
map <leader>se :setlocal spell! spelllang=en<CR>
map <leader>sr :setlocal spell! spelllang=ro<CR>

" ###
" # Plugins
" ###
call plug#begin('~/.local/share/nvim/plugged')

" REMINDER - on a new system install go for hexokinase (color preview)
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'vimwiki/vimwiki'
Plug 'franbach/miramare'

call plug#end()

colorscheme miramare

" hexokinase
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_highlighters = ['backgroundfull']

autocmd VimEnter * HexokinaseTurnOn


" ###
" # Key Remapping
" ###

" Reload this config file
map <C-s> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>e :Ex<CR>

" Easier Write and Quit aliases
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :wq<CR>
nnoremap <leader>w :w<CR>

" Split navigation with leader key
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" New splits
nnoremap <leader>sv :Vex<CR>
nnoremap <leader>sh :Sex<CR>
nnoremap <leader>t :24sp<CR>:term<CR>:startinsert<CR>
" exit insert mode in terminal easier
tnoremap <C-\> <C-\><C-N>

tnoremap <A-k> <C-w>k
