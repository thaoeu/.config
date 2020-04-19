set encoding=utf-8
set fileencodings=utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030
set number
set relativenumber	" number N
set scrolloff=4		" Keep the distance between the up and low
set cursorline		" line
set colorcolumn=80	" 右边的竖条
set list			" show space and tab
set wrap			" 自动换行
set ruler
set confirm			" 在处理未保存或只读文件的时候，弹出确认
set nobackup
set noswapfile

let mapleader = ","
let &t_ut=''		" about theme color
let g:python3_host_porg = '/usr/bin/python3'
let g:python2_host_porg = '/usr/bin/python2.7'
let g:loaded_python_provider = 0
let g:lodaed_python3_provider = 0

syntax enable
set listchars=tab:▸\ ,trail:¬,extends:>,precedes:<
set softtabstop=4	" inentation
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set statusline=%F%m%r%h%w\ -▸%Y'\ ASCII=\%03.3b\ [▸%02l/%L,%02v]
"set wildmenu		" 命令模式下的补全
colorscheme snazzy
set nocompatible	"取消vi兼容

let g:SnazzyTransparent = 1
"set clipboard=unnamedplus 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif							"Restore last position
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()		"PanGu auto typesetting

let g:Hexokinase_highlighters = ['backgroundfull']

" --------
" <leader>
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
"Translate
" --------

nmap <silent> <Space> <Plug>TranslateW
vmap <silent> <Space> <Plug>TranslateWV

nmap <silent> <Leader><Space> <Plug>TranslateR
vmap <silent> <Leader><Space> <Plug>TranslateRV
" --------
"  vimPlug
" --------
call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
" 隐藏其他控件，专注
Plug 'hotoo/pangu.vim'
"『盘古之白』中文排版
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Markdown 同步预览
Plug 'connorholyday/vim-snazzy'
" Snazzy 主题
Plug 'dracula/vim'
" Theme for vim not Nvim

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" 颜色插件，在代码中展示色值
Plug 'yggdroot/indentline'
" 缩进线，主供 Python 使用
Plug 'mhinz/vim-startify'
" 开屏牛助手
Plug 'easymotion/vim-easymotion'
" 快速移动
Plug 'LukeLike/vim-fcitx-switch'
" fcitx switch plug
Plug 'dhruvasagar/vim-table-mode'
" 表格增强插件

Plug 'mbbill/undotree', {'on':'UndotreeToggle'}
" 使用 <leader>u 来展开文件历史
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" 通过 <leader>e 来打开文件管理器
Plug 'Xuyuanp/nerdtree-git-plugin'
" nerdtree 的 Git 同步状态插件

Plug 'SirVer/ultisnips'
" 代码片段
Plug 'honza/vim-snippets'
" 代码片段仓库
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Write go on vim 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'voldikss/vim-translator'
" Translator
call plug#end()
" --------
" Startify
" --------
" let g:startify_padding_left = 20

" --------
"ultisnips
" --------
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsSnippeetDirectories = [$HOME.'/.config/nvim/UltiSnips/', 'UltiSnips/']
" --------
"	 xclip
" --------

function! ClipboardYank()
	call system('xclip -i -selectinon clipboard', @@)
endfunction
function! ClipboardPaste()
	let @@ = system('xclip -o -selectinon clipboard')
endfunction

noremap <leader>y "+y
noremap <leader>Y V"+y
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
"	 Debug
" --------
map <leader>d :call Debug()<Cr>
func! Debug()
if &filetype == 'go'
	exec "GoTest"
elseif &filetype == 'c'
	exec "!g++ % -o %<"
	exec "!time ./%<"
endif
endfunc

" --------
"	   Coc
" --------

" --------
" 延时启动
" --------
" let g:coc_start_at_startup=0
" function! CocTimerStart(timer)
"    exec "CocStart"
" endfunction
" call timer_start(500,'CocTimerStart',{'repeat':1})
" let g:coc_global_extensions = ['coc-marketplace','coc-go','coc-python','coc-vimlsp','coc-snippets','coc-emmet','coc-html','coc-json','coc-css','coc-tsserver','coc-yank','coc-lists','coc-highlight','coc-pairs','coc-ccls','coc-texlab','coc-vimtex']


" --------
"   Vim-Go
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
" git-tree
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
" PlugLine
" --------
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" 为不同层级设定不同缩进线

" --------
" MarkDown
" --------
let g:mkdp_browser = 'vivaldi-stable'
" 指定 Markdown 预览的浏览器
" > >>	引用
" -		无序列表
" 1.	有序列表
" \		转译，忽略 Markdown 转换
noremap <leader>m i#>#<Esc>
noremap <leader>l a--------<Esc>
noremap <leader>t <Esc>/#>#<Cr>:nohlsearch<Cr>c3l
autocmd Filetype markdown inoremap ,r <Esc>:MarkdownPreview<Cr>
" <leader>r 预览
autocmd Filetype markdown inoremap ,h <Esc>/#>#<Cr>:nohlsearch<Cr>c3l
" <leader>h 找到最近的标记
autocmd Filetype markdown inoremap ,t <Esc>/#>#<Cr>:nohlsearch<Cr>c3l<Cr>
" <leader>t 找到标记并换行

autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,l --------<Enter>
" <leader>l 分割
autocmd Filetype markdown inoremap ,b **** #>#<Esc>F*hi
" <leader>b 加粗
autocmd Filetype markdown inoremap ,i ** #>#<Esc>F*i
" <leader>i 斜体
autocmd Filetype markdown inoremap ,s ~~~~ #>#<Esc>F~hi
" <leader>s 划掉
autocmd Filetype markdown inoremap ,c ```<Enter>#>#<Enter>```<Enter><Enter>#>#<Esc>4kA
" <leader>c 代码块
autocmd Filetype markdown inoremap ,d `` #>#<Esc>F`i
" <leader>d 插入代码
"
autocmd Filetype markdown inoremap ,1 <sup></sup>#>#<Esc>F/hi
" <leader>1 插入上角标
autocmd Filetype markdown inoremap ,2 <sub></sub>#>#<Esc>F/hi
" <leader>1 插入下角标
autocmd Filetype markdown inoremap ,e - [ ] <Enter>#>#<ESC>kA
" <leader>e ToDo列表
autocmd Filetype markdown inoremap ,p ![](#>#) #>#<Esc>F[a
" <leader>p 插入图片
autocmd Filetype markdown inoremap ,u [](#>#) #>#<Esc>F[a
" <leader>u 插入链接

autocmd Filetype markdown inoremap ,9 #<Space><Enter>#>#<Esc>kA
autocmd Filetype markdown inoremap ,8 ##<Space><Enter>#>#<Esc>kA
autocmd Filetype markdown inoremap ,7 ###<Space><Enter>#>#<Esc>kA
autocmd Filetype markdown inoremap ,6 ####<Space><Enter>#>#<Esc>kA
autocmd Filetype markdown inoremap ,5 #####<Space><Enter>#>#<Esc>kA
autocmd Filetype markdown inoremap ,4 ######<Space><Enter>#>#<Esc>kA
" <leader>4-9 插入不同层级标题
