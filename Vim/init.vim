set number
set relativenumber
set encoding=utf-8
set scrolloff=4		"Keep the distance between the up and low
" set cursorline
let mapleader = ","
set softtabstop=4	" inentation
set tabstop=4
set shiftwidth=4
set wrap
set wildmenu
set autoindent
let g:python3_host_porg = '/usr/bin/python3'
let g:python2_host_porg = '/usr/bin/python2.7'
let g:loaded_python_provider = 0
let g:lodaed_python3_provider = 0
"set clipboard=unnamedplus
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif	" Restore last position

call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'junegunn/vim-peekaboo'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

nmap <leader>h <Plug>(easymotion-s2)
nmap <leader>gy :Goyo<Cr>
nnoremap <leader>i <Esc>:q<Cr>
nnoremap <leader>w :w<Cr>
nnoremap <leader>s :set spell!<Cr>
nnoremap <leader>ve :vsplit $MYVIMRC<Cr>
nnoremap <leader>vs :source $MYVIMRC<Cr>
nnoremap ; :

inoremap <leader>w <Esc>:w<Cr>
inoremap <c-u> <Esc> viwU

" xclip

function! ClipboardYank()
	call system('xclip -i -selectinon clipboard', @@)
endfunction
function! ClipboardPaste()
	let @@ = system('xclip -o -selectinon clipboard')
endfunction

noremap <leader>y "+y
noremap <leader>p "+p

inoremap <leader>p <Esc>"+p"

" Complie Mod
map <leader>r :call Complie()<Cr>
func! Complie()
	exec "w"
if &filetype == 'c'
	exec "!g++ % -o %<"
	exec "!time ./%<"
elseif &filetype == 'go'
	exec "GoRun"
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

" Test Mod
map <leader>t :call Test()<cr>
func! Test()
if &filetype == 'go'
	exec "GoTest"
endif
endfunc

" Vim-Go
autocmd Filetype go nmap <leader>b <Plug>(go-build)

" MarkDown 

let g:mkdp_browser = 'chromium'

"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,h <Esc>/<(_ _)><Cr>:nohlsearch<Cr>c7l
autocmd Filetype markdown inoremap ,o <Esc>/ <(_ _)><Cr>:nohlsearch<Cr>c5l<Cr>
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <(_ _)><Esc>F*hi
autocmd Filetype markdown inoremap ,m **** <(_ _)><Esc>F*hi
autocmd Filetype markdown inoremap ,i ** <(_ _)><Esc>F*i
autocmd Filetype markdown inoremap ,a ** <(_ _)><Esc>F*i
autocmd Filetype markdown inoremap ,s ~~~~ <(_ _)><Esc>F~hi
autocmd Filetype markdown inoremap ,z <sup></sup><(_ _)><Esc>F/hi
autocmd Filetype markdown inoremap ,v <sub></sub><(_ _)><Esc>F/hi
autocmd Filetype markdown inoremap ,d `` <(_ _)><Esc>F`i
autocmd Filetype markdown inoremap ,r <Esc>:MarkdownPreview<Cr>
autocmd Filetype markdown inoremap ,e - [ ] <Enter><(_ _)><ESC>kA
autocmd Filetype markdown inoremap ,p ![](<(_ _)>) <(_ _)><Esc>F[a
autocmd Filetype markdown inoremap ,u [](<(_ _)>) <(_ _)><Esc>F[a
autocmd Filetype markdown inoremap ,l --------<Enter>
autocmd Filetype markdown inoremap ,c ```<Enter><(_ _)><Enter>```<Enter><Enter><(_ _)><Esc>5kA
autocmd Filetype markdown inoremap ,0 #<Space><Enter><(_ _)><Esc>kA
autocmd Filetype markdown inoremap ,9 ##<Space><Enter><(_ _)><Esc>kA
autocmd Filetype markdown inoremap ,8 ###<Space><Enter><(_ _)><Esc>kA
autocmd Filetype markdown inoremap ,7 ####<Space><Enter><(_ _)><Esc>kA
