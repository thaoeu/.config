" --------
" _/_/_/_/_/  _/
"    _/      _/_/_/      _/_/_/    _/_/      _/_/    _/    _/   
"   _/      _/    _/  _/    _/  _/    _/  _/_/_/_/  _/    _/    
"  _/      _/    _/  _/    _/  _/    _/  _/        _/    _/     
" _/      _/    _/    _/_/_/    _/_/      _/_/_/    _/_/_/      
" --------
set encoding=utf-8
set fileencodings=utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030
let &t_ut=''		" about theme color
set number			" nu
set relativenumber	" number N
set scrolloff=4		" Keep the distance between the up and low
set cursorline		" line
set colorcolumn=80	" 右边的竖条
set ruler
set confirm			" 在处理未保存或只读文件的时候，弹出确认
set nobackup
set noswapfile
syntax enable
colorscheme snazzy
set list			" show space and tab
set listchars=tab:▸\ ,trail:¬,extends:>,precedes:<
let mapleader = ","
set softtabstop=4	" inentation
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set statusline=[%F%m%r%h%w]\ ▸Type-%Y\ [ASCII=\%03.3b]\Hex\%02.2B\ [▸%02l,%02v]\Len%L
set wrap			" 自动换行
"set wildmenu		" : 下的补全
set nocompatible	"取消vi兼容
let g:python3_host_porg = '/usr/bin/python3'
let g:python2_host_porg = '/usr/bin/python2.7'
let g:loaded_python_provider = 0
let g:lodaed_python3_provider = 0

let g:SnazzyTransparent = 1
"set clipboard=unnamedplus 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif							"Restore last position
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()		"PanGu auto typesetting

let g:Hexokinase_highlighters = ['backgroundfull']

" --------
"  vimPlug
" --------
call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'yggdroot/indentline'
Plug 'mbbill/undotree', {'on':'UndotreeToggle'}
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'junegunn/vim-peekaboo'
Plug 'dhruvasagar/vim-table-mode'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'LukeLike/vim-fcitx-switch'	"For input Chinese
Plug 'hotoo/pangu.vim'				"『盘古之白』中文排版
Plug 'connorholyday/vim-snazzy'

call plug#end()

" --------
"  Leader
" --------
nmap <leader>h <Plug>(easymotion-s2)
" nnoremap <C-S-U> m1gUiw`1
" inoremap <C-S-U> <ESC>gUiwgi
nmap <leader>gy :Goyo<Cr>
nnoremap <leader>i <Esc>:q<Cr>
nnoremap <leader>w :w<Cr>
nnoremap <leader>!w :w !tee > ~/File/tee.vim<Cr>
nnoremap <leader>!<leader> :r!cat ~/File/tee.vim<Cr>
nnoremap <leader>s :set spell!<Cr>	" z=　
inoremap <c-s> <c-x>s
nnoremap <leader>ve :vsplit $MYVIMRC<Cr>
nnoremap <leader>vs :source $MYVIMRC<Cr>
nnoremap ; :
noremap <Cr>j 5jzz
noremap <Cr>k 5kzz
noremap - ;
noremap _ ,

inoremap <leader>w <Esc>:w<Cr>
inoremap <c-u> <Esc> viwU

" --------
" xclip
" --------

function! ClipboardYank()
	call system('xclip -i -selectinon clipboard', @@)
endfunction
function! ClipboardPaste()
	let @@ = system('xclip -o -selectinon clipboard')
endfunction

noremap <leader>y "+y
noremap <leader>p "+p

inoremap <leader>p <Esc>"+p"

" --------
" Complie
" --------
map <leader>r :call Complie()<Cr>
func! Complie()
	exec "w"
if &filetype == 'c'
	exec "!g++ % -o %<"
	exec "!time ./%<"
elseif &filetype == 'go'
	exec "!go build %"
	exec "!time ./%<"
elseif &filetype == 'java'
	exec "!javac %<"
	exec "!java %<"
elseif &filetype == 'sh'
	:!time bash %
elseif &filetype == 'python'
	set splitright
	:sp
	:!time python %
elseif &filetype == 'html'
	exec "!vivaldi-stable % &"
elseif &filetype == 'markdown'
	exec "MarkdownPreview"
endif
endfunc

" --------
" Test Mod
" --------
map <leader>t :call Debug()<Cr>
func! Debug()
if &filetype == 'go'
	exec "GoTest"
elseif &filetype == 'c'
	exec "!g++ % -o %<"
	exec "!time ./%<"
endif
endfunc

" --------
" 延时启动
" --------
let g:coc_start_at_startup=0
function! CocTimerStart(timer)
    exec "CocStart"
endfunction
call timer_start(500,'CocTimerStart',{'repeat':1})
let g:coc_global_extensions = ['coc-marketplace','coc-go','coc-python','coc-vimlsp','coc-snippets','coc-emmet','coc-html','coc-json','coc-css','coc-tsserver','coc-yank','coc-lists','coc-highlight','coc-pairs','coc-ccls','coc-texlab','coc-vimtex']

" --------
" Coc
" --------

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" --------
"Vim-Go
" --------
autocmd Filetype go nmap <leader>b <Plug>(go-build)

" --------
" NERDTree
" --------
nnoremap <leader>e :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeShowHidden=1
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" --------
" NERDTree-git
" --------
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" --------
" Undotree
" --------
nnoremap <leader>u :UndotreeToggle <Cr>
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup
set directory=~/.config/nvim/tmp/backup
if has("persistent_undo")
    set undofile
    set undodir=~/.config/nvim/tmp/undo
endif

" --------
" MarkDown
" --------

let g:mkdp_browser = 'vivaldi-stable'

noremap <leader>m a#>#<Esc>
noremap <leader>l a--------<Esc>
noremap <leader>g <Esc>/#>#<Cr>:nohlsearch<Cr>c3l
"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,h <Esc>/#>#<Cr>:nohlsearch<Cr>c3l
autocmd Filetype markdown inoremap ,t <Esc>/#>#<Cr>:nohlsearch<Cr>c3l<Cr>
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** #>#<Esc>F*hi
autocmd Filetype markdown inoremap ,i ** #>#<Esc>F*i
autocmd Filetype markdown inoremap ,s ~~~~ #>#<Esc>F~hi
autocmd Filetype markdown inoremap ,z <sup></sup>#>#<Esc>F/hi
autocmd Filetype markdown inoremap ,v <sub></sub>#>#<Esc>F/hi
autocmd Filetype markdown inoremap ,r <Esc>:MarkdownPreview<Cr>
autocmd Filetype markdown inoremap ,e - [ ] <Enter>#>#<ESC>kA
autocmd Filetype markdown inoremap ,p ![](#>#) #>#<Esc>F[a
autocmd Filetype markdown inoremap ,u [](#>#) #>#<Esc>F[a
autocmd Filetype markdown inoremap ,l --------<Enter>
autocmd Filetype markdown inoremap ,c ```<Enter>#>#<Enter>```<Enter><Enter>#>#<Esc>4kA
autocmd Filetype markdown inoremap ,d `` #>#<Esc>F`i

autocmd Filetype markdown inoremap ,9 #<Space><Enter>#>#<Esc>kA
autocmd Filetype markdown inoremap ,8 ##<Space><Enter>#>#<Esc>kA
autocmd Filetype markdown inoremap ,7 ###<Space><Enter>#>#<Esc>kA
autocmd Filetype markdown inoremap ,6 ####<Space><Enter>#>#<Esc>kA
autocmd Filetype markdown inoremap ,5 #####<Space><Enter>#>#<Esc>kA
autocmd Filetype markdown inoremap ,4 ######<Space><Enter>#>#<Esc>kA
