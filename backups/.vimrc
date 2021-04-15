set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h15
set nobackup
set noundofile
set noswapfile
"-------------------------------------------------------------------------------------------  基本设置
let mapleader=" "
let mapleader="\<Space>"
set number " set norelativenumber
set cursorline
set wrap " 文字不会超出一行大小
set showcmd "让我们知道是什么命令
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu " vim中输入命令时，自动补全
set hlsearch " set hls 高亮显示搜索内容
exec "nohlsearch"
set incsearch " 开启实时搜索功能 边输入边高亮
set ignorecase " 搜索时大小写不敏感
set smartcase "智能大小写
set cole=0
syntax on "语法高亮
syntax enable
set nocompatible " be iMproved, required
filetype on " ajust most filetype
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
" 缩进设置
set expandtab " tab键转换为空格
set tabstop=4 " tab键缩进为4格子
set shiftwidth=4 " 设置格式化时代码缩进为2个空格
set softtabstop=4
set list "行尾的空格显示
set listchars=tab:▸-,eol:↩︎,trail:▫
set term=screen-256color
set scrolloff=5
set autoindent  " 自动缩进
set copyindent " copy the previous indentation on autoindenting
set expandtab  " tab键永远输入的是空格
set softtabstop=0  " 关闭softtabstop 永远不要将空格和tab混合输入
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set ttimeoutlen=0
" 不同模式 不同的光标样式
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
" autoread 也有一个坑吗？！
set autoread
" ===
" === Restore Cursor Position
" 此处有一个坑：就是~/.viminfo权限引起的vim无法记住上次编辑的位置https://blog.csdn.net/yuanlulu/article/details/7056890
" ===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" -------------------------------------------------------------------------------------------- 代码折叠
set nofoldenable
set foldmethod=indent
set cindent
set smartindent
set foldmethod=syntax
set tw=0
" 主题设置
set background=dark
"colorscheme dracula
" colorscheme Tomorrow
" colorscheme lyla
" colorscheme mustang
" colorscheme railscasts
" colorscheme shiny-white
" colorscheme tatami
" colorscheme newsprint
" colorscheme custom
colorscheme ayu
" colorscheme molokai
" colorscheme onedark
" colorscheme solarized
" colorscheme phd
let g:airline_theme='dracula'
" all select copy
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
" visual copy
vmap <C-c> "+y
" clear the space
nnoremap <F2> :g/^\s*$/d<CR>
" diff files
nnoremap <C-F2> :vert diffsplit
map S :w<CR>
map s <nop>
map Q :q<CR>
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>
map R :source $MYVIMRC<CR>
map ; :
map q; q:
" Quick yanking to the end of the line
nnoremap Y y$
" wait for commond to interfact
map ls :browse oldfiles<CR>
" YankRing stuff
let g:yankring_history_dir = '$HOME/.vim/.tmp'
" <tab> use good
inoremap jj <Esc>
cnoremap w!! w !sudo tee % >/dev/null
" Conflict markers {{{
" highlight conflict markers
match ErrorMsg '\v^[<\|=|>]{7}([^=].+)?$'
" shortcut to jump to next conflict marker
nnoremap <silent> <leader>c /\v^[<\|=>]{7}([^=].+)?$<CR>
" }}}
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv
" zz 把这行变成中心
noremap = nzz
noremap - Nzz
" amount {{amount}}
map <LEADER>{ diw<Esc>i{{<Esc>p
map <LEADER>/ :!
map <LEADER>r :r !
map <LEADER>sr :%s/
" edit several files tab more tabs and more window goes diffrent https://blog.csdn.net/aa867734398/article/details/89073849
map tu :tabe<CR>
map te :tabedit 
map tn :-tabnext<CR>
map tm :+tabnext<CR>
map tj :-tabmove<CR>
map tk :+tabmove<CR>
" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>
inoremap <C-U> <Esc>5<C-y>a
inoremap <C-E> <Esc>5<C-e>a
" Rotate screens
" noremap bh <C-w>b<C-w>K
" noremap bv <C-w>b<C-w>H
" 分屏的代码 start
map sr :set splitright<CR>:vsplit<CR>
map sR:set nosplitright<CR>:vsplit<CR>
map sb :set nosplitbelow<CR>:split<CR>
map sB :set splitbelow<CR>:split<CR>
" 分屏时，进行跳转分屏
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
" 分屏时，进行垂直和水平切换
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K
" Resize splits with arrow keys
map <LEADER><up> :resize+5<CR>
map <LEADER><down> :resize-5<CR>
map <LEADER><left> :vertical resize-5<CR>
map <LEADER><right> :vertical resize+5<CR>
" 分屏的代码 end
noremap N 7h
noremap B 5j
noremap E 5k
noremap M 7l
" U/K keys for 5 times u/e (faster navigation)
noremap E 5k
noremap K 5j
" N key: go to the start of the line
noremap N 0
" M key: go to the end of the line
noremap M $
let &t_ut=''
" Faster in-line navigation
noremap W 5w
noremap B 5b
inoremap <LEADER><up> <Esc>5ki
inoremap <LEADER><down> <Esc>5ji
inoremap <LEADER><left> <Esc>5hi
inoremap <LEADER><right> <Esc>5li
vnoremap E 5k
vnoremap K 5j
vnoremap W 5w
vnoremap B 5b
" switch from hls to nohls
noremap <LEADER><CR> :nohlsearch<CR>
" replace tpl
noremap <LEADER>' <Esc>:%s///g<left><left><left>
" commend
noremap <LEADER>/ <Esc>:s/^/\/\//g<CR>
" Press space twice to jump to the next  '' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s
" map ` ~
imap <C-c> <Esc>zza
nmap <C-c> zz
" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>
" back
" <C+i> back to before <C+o> back to ago between file to file
" ---------------------------------------------------------------------------------------------
" N key: go to the start of the line
" noremap <C-n> 0
" noremap <C-i> $
" noremap E 5j
" some text in quotation marks"  ci" (change in 引号) yi" (在双引号中复制)
" di"(在双引号中删除)
" <operation><motion>   d3=>  y3=>  c6=> c1w ciw (在单词中，删除这个单词)
" This is vim： the best editor out there cf: (删除直到找到：，并进入插入模式)
" split  vsplit 上下分屏和左右分屏
" shift + v 进入 v+line模式 选中多个行，然后按：输入normal
" imy-wall-paper,给选中的每一行都加上了my-wall-paper
" 打开和关闭拼写检查 Directory
map <LEADER>sc :set spell!<CR>
"  normal mode: z= insert mode: <C+x>
" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1
" exmple of aborv oo o o 1   1
" ====
" ==== Dress up my vim
" ====
map <LEADER>c1 :set background=dark<CR>:colorscheme dracula<CR>:AirlineTheme dracula<CR>
map <LEADER>c2 :set background=light<CR>:colorscheme ayu<CR>:AirlineTheme ayu light<CR>
" call figlet
map tx :r !figlet
" key maps end----------------------------------------------------------------------
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
" Compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'java'
exec "!javac %"
exec "!time java %<"
elseif &filetype == 'sh'
:!time bash %
elseif &filetype == 'python'
silent! exec "!clear"
exec "!time python3 %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'markdown'
exec "MarkdownPreview"
elseif &filetype == 'vimwiki'
exec "MarkdownPreview"
endif
endfunc
map T :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
exec "w"
if &filetype == 'vim'
exec "source $MYVIMRC"
elseif &filetype == 'markdown'
exec "echo"
endif
endfunc
" vim-plug
call plug#begin('~/.vim/bundle')
Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'Valloric/YouCompleteMe'
" Plug 'vim-syntastic/syntastic'
Plug 'edkolev/tmuxline.vim'
Plug 'majutsushi/tagbar'
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
" Undo Tree
Plug 'mbbill/undotree/'
" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'
" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'
" Python
Plug 'vim-scripts/indentpython.vim'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'   }
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'
" Bookmarks
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'posva/vim-vue'
call plug#end()
" NERDTree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" 关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" Automatically open a NERDTree if no files where specified
" autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap tt :NERDTreeToggle<CR>
" airline
"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" Exuberant ctags
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
" Syntastics
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>
let g:tagbar_type_markdown = {
\ 'ctagstype' : 'markdown',
\ 'kinds' : [
    \ 'h:Heading_L1',
\ 'i:Heading_L2',
\ 'k:Heading_L3'
    \ ]
    \ }
let g:tagbar_type_javascript = {
\ 'ctagsbin' : 'jsctags'
\ }
" let g:tagbar_type_typescript = {
"   \ 'ctagsbin' : 'tstags',
"  \ 'ctagsargs' : '-f-',
"  \ 'kinds': [
"   \ 'e:enums:0:1',
"  \ 'f:function:0:1',
"  \ 't:typealias:0:1',
"  \ 'M:Module:0:1',
"  \ 'I:import:0:1',
"  \ 'i:interface:0:1',
"  \ 'C:class:0:1',
"  \ 'm:method:0:1',
"  \ 'p:property:0:1',
"  \ 'v:variable:0:1',
"  \ 'c:const:0:1',
"  \ ],
"  \ 'sort' : 0
" \ }
let g:tagbar_type_typescript = {
\ 'ctagstype': 'typescript',
\ 'kinds': [
\ 'c:classes',
\ 'n:modules',
\ 'f:functions',
\ 'v:variables',
\ 'v:varlambdas',
\ 'm:members',
\ 'i:interfaces',
\ 'e:enums',
\ ]
\ }
" vim-javascript
let g:javascript_plugin_jsdoc = 1
let javascript_enable_domhtmlcss = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
au!
au FileType javascript setlocal foldmethod=syntax
augroup END
" YouCompleteMe
if !exists("g:ycm_semantic_triggers")
let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
"ctrlp
let g:ctrlp_show_hidden=1 "显示隐藏文件
" 忽略一下文件类型
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$',
\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
" autoformat
noremap <F3> :Autoformat<CR>
" vim-indentline
let g:indentLine_color_term = 239 "对齐线颜色
let g:indentLine_char = '▏' "对齐线符号, c表示任意ASCII码字符, 你还可以用下面这几个符号之一:  ¦, ┆, │, ⎸, 或 ▏
" ale-setting {{{
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
" let g:ale_lint_on_enter = 0
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\   'javascript': ['eslint'],
\}
" }}}
" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" backup-url: https://www.jianshu.com/p/06ea892566e7?open_source=weibo_search
"" ===
"" === NERDTree
"" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
"" ==
"" == NERDTree-git
"" ==
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
"" ===
"" === You Complete ME
"" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
"let g:ycm_python_interpreter_path :
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

"" ===
"" === vim-table-mode
"" ===
map <LEADER>tm :TableModeToggle<CR>

"" ===
"" === Python-syntax
"" ===
let g:python_highlight_all = 1
let g:python_slow_sync = 0
"" ===
"" === vim-indent-guide
"" ===
"    let g:indent_guides_guide_size = 1
"    let g:indent_guides_start_level = 2
"    let g:indent_guides_enable_on_vim_startup = 1
"    let g:indent_guides_color_change_percent = 1
"    silent! unmap <LEADER>ig
"    autocmd WinEnter * silent! unmap <LEADER>ig
"
"
"" ===
"" === Goyo
"" ===
map <LEADER>gy :Goyo<CR>
"" ===
"" === vim-signiture
"" ===
let g:SignatureMap = {
    \ 'Leader'             :  "m",
    \ 'PlaceNextMark'      :  "m,",
    \ 'ToggleMarkAtLine'   :  "m.",
    \ 'PurgeMarksAtLine'   :  "dm-",
    \ 'DeleteMark'         :  "dm",
    \ 'PurgeMarks'         :  "dm/",
    \ 'PurgeMarkers'       :  "dm?",
    \ 'GotoNextLineAlpha'  :  "m<LEADER>",
    \ 'GotoPrevLineAlpha'  :  "",
    \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
    \ 'GotoPrevSpotAlpha'  :  "",
    \ 'GotoNextLineByPos'  :  "",
    \ 'GotoPrevLineByPos'  :  "",
    \ 'GotoNextSpotByPos'  :  "mn",
    \ 'GotoPrevSpotByPos'  :  "mp",
    \ 'GotoNextMarker'     :  "",
    \ 'GotoPrevMarker'     :  "",
    \ 'GotoNextMarkerAny'  :  "",
    \ 'GotoPrevMarkerAny'  :  "",
    \ 'ListLocalMarks'     :  "m/",
    \ 'ListLocalMarkers'   :  "m?"
    \ }
"" ===
"" === Undotree
"" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>
" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chrome'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
" ===
" === uneffective setup
" ===
" set noswapfile
" set nobackup
" set noundofile
" <operation> <motion>
" operation: d,删除, p,剪切，y，复制,c,change，缩写，删除并且进入插入模式
" motion: w,一个词，b，上一个词，iw，在词中，eg：ci",
" some words in there "
" This is vim: the best editor out there.
" df: 删除寻找:
" yf: 复制寻找:
" cf:
" d3<left> 往左删除3个
" set listchars=tab:▸\ ,trail:▫
" set backspace=4
" set whichwrap+=<,>,h,l
" key maps start-------------------------------
" h left j down k top l right
" under normal mode
" new tab
" map <M-F2> :tabnew<CR>
" list cuSrrent dir flies
" map <F3> :tabnew .<CR>
" add <!-- --> ()pair and remove '{' for html file
