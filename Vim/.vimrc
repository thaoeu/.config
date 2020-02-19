let mapleader = ","
set nu
set autoindent

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
nmap <leader>f <Plug>(easymotion-s2)


nnoremap <leader>w :w<Cr>
nnoremap <leader>s <Esc>:
nnoremap ; :
nnoremap J 5j
nnoremap K 5k
nnoremap H 5h
nnoremap L 5l
nnoremap <leader>ve :vsplit $MYVIMRC<Cr>
nnoremap <leader>vs :source $MYVIMRC<Cr>

noremap <leader>i <Esc>:q<Cr>

inoremap <leader>w <Esc>:w<Cr>
inoremap <c-u> <Esc> viwU

map <leader>r :call Complie()<Cr>
func! Complie()
	exec "w"
if &filetype == 'c'
	exec "!g++ % -o %<"
	exec "!time ./%<"
elseif &filetype == 'java'
	exec "!javac %"
	exec "!java %<"
elseif &filetype == 'sh'
	:!time bash %
elseif &filetype == 'python'
	set splitright
	:sp
	:term python3 %
elseif &filetype == 'markdown'
	exec "MarkdownPreview"
endif
endfunc


"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,h <Esc>/<(_ _)><Cr>:nohlsearch<Cr>c7l
autocmd Filetype markdown inoremap ,o <Esc>/ <(_ _)><Cr>:nohlsearch<Cr>c5l<Cr>
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <(_ _)><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <(_ _)><Esc>F~hi
autocmd Filetype markdown inoremap ,z <sup></sup><(_ _)><Esc>F/hi
autocmd Filetype markdown inoremap ,v <sub></sub><(_ _)><Esc>F/hi
autocmd Filetype markdown inoremap ,t ** <(_ _)><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <(_ _)><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><(_ _)><Enter>```<Enter><Enter><(_ _)><Esc>5kA
autocmd Filetype markdown inoremap ,r <Esc>:MarkdownPreview<Cr>
autocmd Filetype markdown inoremap ,m - [ ] <Enter><(_ _)><ESC>kA
autocmd Filetype markdown inoremap ,p ![](<(_ _)>) <(_ _)><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<(_ _)>) <(_ _)><Esc>F[a
autocmd Filetype markdown inoremap ,0 #<Space><Enter><(_ _)><Esc>kA
autocmd Filetype markdown inoremap ,9 ##<Space><Enter><(_ _)><Esc>kA
autocmd Filetype markdown inoremap ,8 ###<Space><Enter><(_ _)><Esc>kA
autocmd Filetype markdown inoremap ,7 ####<Space><Enter><(_ _)><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>
