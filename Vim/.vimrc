let mapleader = ","
set nu
set relativenumber
set cursorline
set confirm
set nobackup
set colorcolumn=80	" 右边的竖条
syntax enable

map ; :
nnoremap <leader>w :w<Cr>
inoremap <leader>w <Esc>:w<Cr>
nnoremap <leader>i :q<Cr>
noremap <Cr>j 5jzz
noremap <Cr>k 5kzz

call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

colorscheme dracula
map <leader>h <Plug>(easymotion-s2)
