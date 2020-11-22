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
set scrolloff=5

set cursorline

" Netrw settings
let g:netrw_liststyle = 0
let g:netrw_banner = 0

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

" REMINDER - some plugins have the following external dependencies
" hexokinase(color preview): go
" coc(code completion): nodejs, yarn
" vimdiscord: nvim installed from pip (python extension thingy)
Plug 'vbe0201/vimdiscord'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'vimwiki/vimwiki'
"Plug 'franbach/miramare'
Plug 'cocopon/iceberg.vim'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme iceberg

" hexokinase
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_highlighters = ['backgroundfull']

autocmd VimEnter * HexokinaseTurnOn


" ###
" # Fern  -- sidebar file manager
" ###

let g:fern#drawer_width = 30
let g:fern#default_hidden = 1
let g:fern#disable_drawer_auto_quit = 1

""" KEYBIND TO TOGGLE FERN
noremap <leader>f :Fern . -drawer -toggle <CR>

function! s:init_fern() abort
  nmap <buffer> H <Plug>(fern-action-open:split)
  nmap <buffer> V <Plug>(fern-action-open:vsplit)
  nmap <buffer> R <Plug>(fern-action-rename)
	nmap <buffer> M <Plug>(fern-action-move)
	nmap <buffer> C <Plug>(fern-action-copy)
	"nmap <buffer> N <Plug>(fern-action-new-path)
	nmap <buffer> T <Plug>(fern-action-new-file)
	nmap <buffer> D <Plug>(fern-action-new-dir)
	nmap <buffer> S <Plug>(fern-action-hidden-toggle)
	nmap <buffer> dd <Plug>(fern-action-trash)
  nmap <buffer> m <Plug>(fern-action-mark)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END


""" C Compiler!
function! TermWrapper(command) abort
	exec '20sp '
	exec 'term ' . a:command
	exec 'startinsert'
endfunction
command! -nargs=0 CompileAndRun call TermWrapper(printf('gcc -lm %s && ./a.out', expand('%'), <args>))

" ###
" # Key Remapping
" ###

" Reload this config file
map <C-s> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>e :Ex<CR>

" Easier Write and Quit aliases
"nnoremap <silent> <leader>q :CocCommand cord.disconnect<CR>:q<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <leader>Q :wq<CR>
nnoremap <leader>w :w<CR>

" Split navigation with leader key
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-h> :vertical resize +3<CR>
noremap <silent> <C-l> :vertical resize -3<CR>
noremap <silent> <C-k> :resize +3<CR>
noremap <silent> <C-j> :resize -3<CR>

" New splits
nnoremap <leader>sv :Vex<CR>
nnoremap <leader>sh :Sex<CR>
nnoremap <leader>t :24sp<CR>:term<CR>:startinsert<CR>
nnoremap <leader>cc :CompileAndRun<CR>

" exit insert mode in terminal easier
tnoremap <C-\> <C-\><C-N>

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
