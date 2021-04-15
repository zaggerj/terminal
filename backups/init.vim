" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"
" $XDG_CONFIG_HOME defind in .zshrc
"Author: @zagger

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source $XDG_CONFIG_HOME/nvim/_machine_specific.vim


" ====================
" === EditoR Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamed
let &t_ut=''
set autochdir


" ===
" === Editor behavior
" ===
" to fixed press up and down key bug,sometimes to be A B C D
set nocp
set exrc
set secure
set number
set relativenumber
set cursorline
" coc required
set hidden
set noexpandtab
" number of spaces a <Tab> in the text stands for
set tabstop=4
" number of spaces used for each step of (auto)indent<Paste>
set shiftwidth=4
" if non-zero, number of spaces to insert for a <Tab>
set softtabstop=4
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout

set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ====
" ==== coc.vim required
" ====
" Better display for messages
"set cmdheight=2
"" 让vim响应更加快一
"set updatetime=100
"" always show signcolumns
"set signcolumn=yes
"" Always show the signcolumn, otherwise it would shift the text each time
"" diagnostics appear/become resolved.
"if has("patch-8.1.1564")
"	" Recently vim can merge signcolumn and number column into one
"	set signcolumn=number
"else
"	set signcolumn=yes
"endif
"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')
"
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" ===
" === Terminal Behavior
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ===
" === Status bar behaviors
" ===
set noshowmode
set showcmd
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu

" Searching options
exec "nohlsearch"
set ignorecase
set smartcase


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
" not fit for me
" noremap ; :

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

" Open and  the vimrc file anytime
noremap <LEADER>rc :tabedit ~/.config/nvim/init.vim<CR>
noremap <LEADER>r :来源 ~/.config/nvim/init.vim<CR>

" Quick yanking to the end of the line
nnoremap Y y$

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y
" Visual copy
vmap <C-c> "+y
map <F12> gg=G
" Copy to system clipboard
" vnoremap Y :w !pbcopy <CR>

" Indentation
nnoremap < <<
nnoremap > >>
" <tab> use good
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

" Search
noremap <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz
noremap - N
noremap = n

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g

" Folding
" 展开 https://zhuanlan.zhihu.com/p/27473875
noremap <silent> <LEADER>o za
" 收起
noremap <silent> <LEADER>w zc
" foldmethod=mark时 创建折叠 zf56G 创建从当前行起到56行的代码折叠 10zf或10zf+或zf10↓，创建从当前行起到后10行的代码折叠。在括号处zf%，创建从当前行起到对应的匹配的括号上去（（），{}，[]，<>等）。
"noremap <silent> <LEADER>i zf
" 全部展开
noremap <silent> <LEADER>n zm
noremap <silent> <LEADER>N zM
" 全部折叠
noremap <silent> <LEADER>m zr
noremap <silent> <LEADER>M zR
" ls
map ls :browse oldfiles<CR>

" sudo edit
cnoremap w!! w !sudo tee % >/dev/null

inoremap jj <Esc>

" ===
" === Cursor Movement
" ===
" U/E keys for 5 times u/e (faster navigation)
noremap K 5k
noremap E 5j

" N key: go to the start of the line
noremap N ^

" I key: go to the end of the line
noremap M $

" Faster in-line navigation
noremap W 5w
noremap B 5b

vnoremap K 5k
vnoremap E 5j
vnoremap W 5w
vnoremap B 5b

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>
"inoremap <C-U> <Esc>5<C-y>a
"inoremap <C-E> <Esc>5<C-e>a


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

" resize splits with arrow keys
map <leader><up> :res +5<CR>
map <leader><down> :res -5<CR>
map <leader><left> :vertical resize-5<CR>
map <leader><right> :vertical resize+5<CR>
inoremap <s-up> <Esc>5ki
inoremap <s-down> <Esc>5ji
inoremap <s-left> <Esc>5hi
inoremap <s-right> <Esc>5li

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Disabling the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map se :set splitbelow<CR>:split<CR>
map sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map si :set splitright<CR>:vsplit<CR>

" show indentLine
map <LEADER>\  :IndentLinesToggle <CR>

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H


" ===
" === Tab management
" ===
" Create a new tab with tu
map tu :tabe<CR>
" shortcut to edit new tab
map te :tabedit
" Move around tabs with tn and ti
map tn :-tabnext<CR>
map tm :+tabnext<CR>

" ===
" === buffer management
" ===
map ls :ls<CR>
map ba :badd<space>
map bd :bd


" ===
" === Markdown Settings
" ===
" Snippets
source $XDG_CONFIG_HOME/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Opening a terminal window
map <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>S
imap <C-c> <Esc>zza
noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
map tx :r !figlet

" find and replace
noremap \s :%s//g<left><left>

" set wrap
noremap <LEADER>sw :set wrap<CR>

" press f10 to show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:fltter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
Plug 'theniceboy/nvim-deus'
" Plug 'ajmwagar/vim-deus'

" Status line
Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'

" Genreal Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'

" Taglist
Plug 'liuchengxu/vista.vim'

" Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': 'v0.0.79'}
Plug 'wellle/tmux-complete.vim'

" Snippets
" Plug 'SirVer/ultisnips'
Plug 'theniceboy/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim'

" Autoformat
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'

" TeX
" Plug 'lervag/vimtex'

" CSharp
Plug 'OmniSharp/omnisharp-vim'
Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jaxbot/browserlink.vim'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'posva/vim-vue'
" Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'leafOfTree/vim-svelte-plugin'
" Plug 'leafgarland/typescript-vim'

" Go
" Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
" Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
" Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
" Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
" Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

" Flutter
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'f-person/pubspec-assist-nvim', { 'for' : ['pubspec.yaml'] }

" Swift
" Plug 'keith/swift.vim'
" Plug 'arzg/vim-swift'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" Other filetypes
" Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

" Editor Enhancement
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
Plug 'theniceboy/antovim' " gs to switch
" type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`
" cs'<q>,cst",ds",ysiw},yssb entire line yss)
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
" press enter to select block code,press again ,to select large block.
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
Plug 'easymotion/vim-easymotion'
" Plug 'Konfekt/FastFold'
"Plug 'junegunn/vim-peekaboo'
"Plug 'wellle/context.vim'
Plug 'svermeulen/vim-subversive'
Plug 'theniceboy/argtextobj.vim'
Plug 'rhysd/clever-f.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'theniceboy/pair-maker.vim'
Plug 'theniceboy/vim-move'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'Yggdroot/indentLine'

" For general writing
" Plug 'junegunn/goyo.vim'
"Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'

" Bookmarks
" Plug 'MattesGroeger/vim-bookmarks'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Documentation
"Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
"Plug 'jceb/vim-orgmode'
"Plug 'mhinz/vim-startify'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" Vim Applications
Plug 'itchyny/calendar.vim'

" Other visual enhancement
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/terminus'

" Other useful utilities
" Forgot to sudo vim  Just do :sudowrite or :sw
Plug 'lambdalisue/suda.vim'
" Plug 'makerj/vim-pdf'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc' " vim-session dep

" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
" Plug 'roxma/nvim-yarp'

call plug#end()
set re=0

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

"color dracula
"color ayu
"color one
color deus
"colorscheme snazzy
"color gruvbox
"let ayucolor="light"
"color ayu
"color xcodelighthc
"set background=light
"set cursorcolumn


hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" ===================== Start of Plugin Settings =====================

" ===
" === eleline.vim
" ===
let g:airline_powerline_fonts = 0

" ==
" == GitGutter
" ==
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>

" ===
" === coc
" ===
" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = [
			\ 'coc-html',
			\ 'coc-tasks',
			\ 'coc-json',
			\ 'coc-explorer',
			\ 'coc-prettier',
			\ 'coc-tslint-plugin',
			\ 'coc-css',
			\ 'coc-emmet',
			\ 'coc-pairs',
			\ 'coc-git',
			\ 'coc-gitignore',
			\ 'coc-lists',
			\ 'coc-diagnostic',
			\ 'coc-snippets',
			\ 'coc-translator',
			\ 'coc-tsserver',
			\ 'coc-vetur',
			\ 'coc-yaml',
			\ 'coc-yank',
			\ 'coc-gitignore',
			\ 'coc-vimlsp']

" coc-translator Press ts to translate word under cursor
" ====================== old setting
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" press tab to complete
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" shortcut
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()

" press enter to comfirm selection
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" show document
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>

nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
	execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w

nnoremap <space>e :CocCommand explorer<CR>
tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> <M-o> :RnvimrToggle<CR>
tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>

" ====================== old setting


" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '/Users/david/Desktop/log.txt'

" use shortcut to navigate diagnostic
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
	execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'David Chen'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" <C-n> 和 <C-p> 
"noremap <leader>i :CocCommand document.renameCurrentWord
"noremap <leader>I <Plug>(coc-cursors-word)
"nmap <leader>rf <Plug>(coc-refactor)
":CocSearch


" ===
" === easyalign
" ===
" apple  = red
" grass+ = green
" sky-   = blue
" vipga=
" visual-select inner paragraph
" Start EasyAlign command (ga)
" Align around =
" gaip=
" Start EasyAlign command (ga) for inner paragraph
" Align around =

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ===
" === FZF
" ===
set rtp+=/Users/huangzijie/.fzf/bin/fzf
nnoremap <c-p> :Leaderf file<CR>
nnoremap <leader>fo :Files<CR>
" noremap <silent> <C-p> :Files<CR>
" rg search result
noremap <silent> <C-f> :Rg<CR>
" v:oldfiles and open buffers
noremap <silent> <C-h> :History<CR>
"noremap <C-t> :BTags<CR>
" noremap <silent> <C-l> :Lines<CR>
noremap <silent> <C-w> :Buffers<CR>
noremap <leader>; :History:<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
	redir => list
	silent ls
	redir END
	return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
	execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
			\ 'source': s:list_buffers(),
			\ 'sink*': { lines -> s:delete_buffers(lines) },
			\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
			\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" ===
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_CommandMap = {
			\   '<C-k>': ['<C-u>'],
			\   '<C-j>': ['<C-e>'],
			\   '<C-]>': ['<C-v>'],
			\   '<C-p>': ['<C-n>'],
			\}
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
			\ 'dir': ['.git', 'vendor', 'node_modules'],
			\ 'file': ['__vim_project_root']
			\}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0

" ===
" === CTRLP (Dependency for omnisharp)
" ===
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'

" ===
" === vim-bookmarks
" ===
" let g:bookmark_no_default_key_mappings = 1
" nmap mt <Plug>BookmarkToggle
" nmap ma <Plug>BookmarkAnnotate
" nmap ml <Plug>BookmarkShowAll
" nmap mi <Plug>BookmarkNext
" nmap mn <Plug>BookmarkPrev
" nmap mC <Plug>BookmarkClear
" nmap mX <Plug>BookmarkClearAll
" nmap mu <Plug>BookmarkMoveUp
" nmap me <Plug>BookmarkMoveDown
" nmap <Leader>g <Plug>BookmarkMoveToLine
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_auto_save = 1
" let g:bookmark_highlight_lines = 1
" let g:bookmark_manage_per_buffer = 1
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_center = 1
" let g:bookmark_auto_close = 1
" let g:bookmark_location_list = 1

" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc

" ==
" == vim-multiple-cursor
" ==
"let g:multi_cursor_use_default_mapping = 0
"let g:multi_cursor_start_word_key = '<c-k>'
"let g:multi_cursor_select_all_word_key = '<a-k>'
"let g:multi_cursor_start_key = 'g<c-k>'
"let g:multi_cursor_select_all_key = 'g<a-k>'
"let g:multi_cursor_next_key = '<c-k>'
"let g:multi_cursor_prev_key = '<c-p>'
"let g:multi_cursor_skip_key = '<C-s>'
"let g:multi_cursor_quit_key = '<Esc>'


" ===
" === vim-visual-multi
" ===
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
"let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
"let g:VM_maps                       = {}
"let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
"let g:VM_maps['i']                  = 'k'
"let g:VM_maps['I']                  = 'K'
"let g:VM_maps['Find Under']         = '<C-k>'
"let g:VM_maps['Find Subword Under'] = '<C-k>'
"let g:VM_maps['Find Next']          = ''
"let g:VM_maps['Find Prev']          = ''
"let g:VM_maps['Remove Region']      = 'q'
"let g:VM_maps['Skip Region']        = '<c-n>'
"let g:VM_maps["Undo"]               = 'l'
"let g:VM_maps["Redo"]               = '<C-r>'

" ===
" === Far.vim
" ===
noremap <LEADER>f :F  **/*<left><left><left><left><left>
let g:far#mapping = {
			\ "replace_undo" : ["l"],
			\ }


" ===
" === vim-calc
" ===
"noremap <LEADER>a :call Calc()<CR>
" Testing
"if !empty(glob('~/Github/vim-calc/vim-calc.vim'))
"source ~/Github/vim-calc/vim-calc.vim
"endif


" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]

" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }
" function! NearestMethodOrFunction() abort
"	return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15

" ===
" === fzf-gitignore
" ===
noremap <LEADER>gi :FzfGitignore<CR>


" ===
" === Ultisnips
" ===
" let g:tex_flavor = "latex"
" inoremap <c-n> <nop>
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-e>"
" let g:UltiSnipsJumpBackwardTrigger="<c-n>"
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" " Solve extreme insert-mode lag on macOS (by disabling autotrigger)
" augroup ultisnips_no_auto_expansion
"     au!
"     au VimEnter * au! UltiSnips_AutoTrigger
" augroup END
"

" ===
" === vimtex
" ===
"let g:vimtex_view_method = ''
let g:vimtex_view_general_viewer = 'llpp'
let g:vimtex_mappings_enabled = 0
let g:vimtex_text_obj_enabled = 0
let g:vimtex_motion_enabled = 0
let maplocalleader=' '


" ===
" === vim-calendar
" ===
"noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
augroup calendar-mappings
	autocmd!
	" diamond cursor
	autocmd FileType calendar nmap <buffer> u <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> n <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> e <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_right)
	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> K <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-n>
	autocmd FileType calendar nunmap <buffer> <C-p>
augroup END


" ===
" === vim-go
" ===
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0


" ===
" === AutoFormat
" ===
"augroup autoformat_settings
	" autocmd FileType bzl AutoFormatBuffer buildifier
	"autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
	" autocmd FileType dart AutoFormatBuffer dartfmt
	" autocmd FileType go AutoFormatBuffer gofmt
	" autocmd FileType gn AutoFormatBuffer gn
	"autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	" autocmd FileType java AutoFormatBuffer google-java-format
	" autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
	" autocmd FileType rust AutoFormatBuffer rustfmt
	" autocmd FileType vue AutoFormatBuffer prettier
"augroup END


" ===
" === OmniSharp
" ===
let g:OmniSharp_typeLookupInPreview = 1
let g:omnicomplete_fetch_full_documentation = 1

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_selector_ui = 'ctrlp'

autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>

sign define OmniSharpCodeActions text=💡

augroup OSCountCodeActions
	autocmd!
	autocmd FileType cs set signcolumn=yes
	autocmd CursorHold *.cs call OSCountCodeActions()
augroup END

function! OSCountCodeActions() abort
	if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
	if !OmniSharp#IsServerRunning() | return | endif
	let opts = {
				\ 'CallbackCount': function('s:CBReturnCount'),
				\ 'CallbackCleanup': {-> execute('sign unplace 99')}
				\}
	call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
	if a:count
		let l = getpos('.')[1]
		let f = expand('%:p')
		execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
	endif
endfunction


" ===
" === vim-easymotion
" ===
nmap <leader>s <Plug>(easymotion-s2)
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
" map ' <Plug>(easymotion-overwin-f2)
" nmap ' <Plug>(easymotion-overwin-f2)
"map E <Plug>(easymotion-j)
"map U <Plug>(easymotion-k)
"nmap f <Plug>(easymotion-overwin-f)
"map \; <Plug>(easymotion-prefix)
"nmap ' <Plug>(easymotion-overwin-f2)
"map 'l <Plug>(easymotion-bd-jk)
"nmap 'l <Plug>(easymotion-overwin-line)
"map  'w <Plug>(easymotion-bd-w)
"nmap 'w <Plug>(easymotion-overwin-w)


" ===
" === goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === jsx
" ===
let g:vim_jsx_pretty_colorful_config = 1


" ===
" === fastfold
" ===
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1


" ===
" === tabular
" ===
vmap ga :Tabularize /


" ===
" === vim-after-object
" ===
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ===
" === rainbow
" ===
let g:rainbow_active = 1


" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap to :XTabCycleMode<CR>
noremap \p :echo expand('%:p')<CR>


" ===
" === vim-session
" ===
"let g:session_directory = $HOME."/.config/nvim/tmp/sessions"
"let g:session_autosave = 'no'
"let g:session_autoload = 'no'
"let g:session_command_aliases = 1
"set sessionoptions-=buffers
"set sessionoptions-=options
"noremap sl :OpenSession<CR>
"noremap sS :SaveSession<CR>
"noremap ss :SaveSession
"noremap sc :SaveSession<CR>:CloseSession<CR>:q<CR>
"noremap so :OpenSession default<CR>
"noremap sD :DeleteSession<CR>
""noremap sA :AppendTabSession<CR>


" ===
" === context.vim
" ===
"let g:context_add_mappings = 0
"noremap <leader>ct :ContextToggle<CR>


" ===
" === suda.vim
" ===
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%


" ===
" === vimspector
" ===
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad


" ===
" === reply.vim
" ===
"noremap <LEADER>rp :w<CR>:Repl<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rs :ReplSend<CR><C-w><C-l>a<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rt :ReplStop<CR>


" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
			\ '<C-t>': 'NvimEdit tabedit',
			\ '<C-x>': 'NvimEdit split',
			\ '<C-v>': 'NvimEdit vsplit',
			\ 'gw': 'JumpNvimCwd',
			\ 'yw': 'EmitRangerCwd'
			\ }
let g:rnvimr_layout = { 'relative': 'editor',
			\ 'width': &columns,
			\ 'height': &lines,
			\ 'col': 0,
			\ 'row': 0,
			\ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]


" ===
" === vim-subversive
" ===
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)


" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl


" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1


" ===
" === AsyncRun
" ===
noremap gp :AsyncRun git push<CR>


" ===
" === AsyncTasks
" ===
let g:asyncrun_open = 6


" ===
" === dart-vim-plugin
" ===
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:dartfmt_options = ["-l 100"]


" ===
" === tcomment_vim
" ===
nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<


" ===
" === vim-move
" ===
let g:move_key_modifier = 'C'


" ===
" === any-jump
" ===
nnoremap <leader>j :AnyJump<CR>
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9
let g:any_jump_grouping_enabled = 0
" Remove comments line from search results (default: 1)
let g:any_jump_remove_comments_from_results = 1
" Custom ignore files
" default is: ['*.tmp', '*.temp']
let g:any_jump_ignored_files = ['*.tmp', '*.temp', 'node_modules/', '*.map', 'built/', 'libs/', '.git/']
":AnyJumpArg myKeyword
" Visual mode: jump to selected text in visual mode
"xnoremap <leader>j :AnyJumpVisual<CR>
"
"" Normal mode: open previous opened file (after jump)
"nnoremap <leader>ab :AnyJumpBack<CR>
"
"" Normal mode: open last closed search window again
"nnoremap <leader>al :AnyJumpLastResults<CR>


" ===
" === typescript-vim
" ===
let g:typescript_ignore_browserwords = 1


" ===
" === Agit
" ===
nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1


" ===
" === nvim-treesitter(unused)
" ===
"lua" <<EOF
"require"'nvim-treesitter.configs'.setup {
"	  "ensure_installed = {"typescript", "dart", "java"},	 -- one of "all", "language", or a list of languages
"	  "highlight = {
"  "enable = true,			  -- false will disable the whole extension
"  "disable = { "c", "rust" },  -- list of language that will be disabled
"  "},
"  "}
"  "EOF


" ===
" === lazygit.nvim
" ===
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support


" ===
" === NERDTree
" ===
noremap tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "N"
let NERDTreeMapUpdirKeepOpen = "n"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "I"
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapOpenInTabSilent = "O"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = ""
let NERDTreeMapChangeRoot = "l"
let NERDTreeMapMenu = ","
let NERDTreeMapToggleHidden = "zh"


" ===
" === NERDTree-git
" ===
"let g:NERDTreeIndicatorMapCustom = {
"    \ "Modified"  : "✹",
"    \ "Staged"    : "✚",
"    \ "Untracked" : "✭",
"    \ "Renamed"   : "➜",
"    \ "Unmerged"  : "═",
"    \ "Deleted"   : "✖",
"    \ "Dirty"     : "✗",
"    \ "Clean"     : "✔︎",
"    \ "Unknown"   : "?"
"    \ }
" Some testing features
set shortmess+=c
set notimeout


" ===
" === vim-indent-guide
" ===
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 1
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_color_change_percent = 1
" silent! unmap <LEADER>ig
" autocmd WinEnter * silent! unmap <LEADER>ig
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" ===
" === some error checking
" ===


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1
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
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>


" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === vim-signiture
" ===
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


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>


" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<c-k>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key           = 'g<c-k>'
let g:multi_cursor_select_all_key      = 'g<a-k>'
let g:multi_cursor_next_key            = '<c-k>'
let g:multi_cursor_prev_key            = '<c-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" My snippits
source ~/.config/nvim/snippits.vim
" comfortable-motion
"nnoremap <silent> <C-e> :call comfortable_motion#flick(50)<CR>
"nnoremap <silent> <C-u> :call comfortable_motion#flick(-50)<CR>
"let g:comfortable_motion_no_default_key_mappings = 1
"let g:comfortable_motion_interval = 1
" Startify
let g:startify_lists = [
			\ { 'type': 'files',     'header': ['   MRU']            },
			\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
			\ { 'type': 'commands',  'header': ['   Commands']       },
			\ ]


" Far.vim
"nnoremap <silent> <LEADER>f :F  %<left><left>
" ===
" === Far.vim
" ===
" find only :F {patten}{file-mask}[params]
noremap <LEADER>f :F  **/*<left><left><left><left><left>
"Far {patten}{repalce-with}{file-mask}[params]
noremap <LEADER>F :Far  **/*<left><left><left><left>
let g:far#mapping = {
			\ "replace_undo" : ["l"],
			\ }


" Testring my own plugin
if !empty(glob('~/Github/vim-calc/vim-calc.vim'))
	source ~/Github/vim-calc/vim-calc.vim
endif
" map <LEADER>a :call Calc()<CR>
let g:user_emmet_leader_key='<C-f>'
" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif
" vim-indentline
let g:indentLine_enabled = 1
let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_bgcolor_term = 202
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_gui = '#FF5F00'
let g:indentLine_color_tty_dark = 1
"对齐线颜色
let g:indentLine_char = '¦'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
"对齐线符号, c表示任意ASCII码字符, 你还可以用下面这几个符号之一:  ¦, ┆, │, ⎸, 或 ▏
" all select copy
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" visual copy
vmap <C-c> "+y
" Quick yanking to the end of the line
nnoremap Y y$
" replace tpl
noremap <LEADER>' <Esc>:%s///g<left><left><left>

" ======
" ======tender theme modify
" ======
" 开启 24 位真彩色支持
" 24位真彩色信息请参考 https://gist.github.com/XVilka/8346728
" set termguicolors
" 设置主题
" color tender
" tender 默认背景色是一种亮灰色，晚上特别不舒服，改成纯黑
" highlight Normal guibg=#000001
" 改背景后选中区域无法高亮，也得调一下
" highlight Visual guibg=#323232
" 灰色的状态栏很扎眼，调一下
" highlight StatusLine guibg=#444444 guifg=#b3deef
" vim 的 terminal 状态栏需要单独配置
" highlight StatusLineTerm guibg=#444444 guifg=#b3deef
" highlight StatusLineTermNC guibg=#444444 guifg=#999999


" ======
" ======mru setting
" ======
" set max lenght for the mru file list
let g:mru_file_list_size = 7 " default value
" set path pattens that should be ignored
let g:mru_ignore_patterns = 'fugitive\|\.git/\|\_^/tmp/' " default value
" 允许隐藏被修改过的 buffer
set hidden

" normal 模式下使用 bl 列出 Buffer 列表
nnoremap <silent> bl :ls<CR>

" normal 模式下使用 bo 打开一个新 Buffer
nnoremap <silent> bo :enew<CR>

" normal 模式下使用 bn 切换到下一个 Buffer
nnoremap <silent> bn :bnext<CR>

" normal 模式下使用 bn 切换到上一个 Buffer
nnoremap <silent> bp :bprevious<CR>

" normal 模式下使用 bd 关闭当前 Buffer
nnoremap <silent> bd :bdelete<CR>
nnoremap <silent> bc :e ~/.config/nvim/init.vim<CR>

" 允许 airline 在顶部显示 Buffer 列表
let g:airline#extensions#tabline#enabled=1

" 显示 buffer 编号，方便切换
let g:airline#extensions#tabline#buffer_nr_show=1
" rename current filename
nnoremap sw :!mv % %:r.bak
" modify the file Suffix
nnoremap se :sav! %<.bak
" save as
nnoremap sa :sav! %
" reload current file
nnoremap fr :e<CR>
nnoremap fR :e!<CR>
" delete match /console/ line
nnoremap sg :g//d<left><left>
" sort invert
" :g/^/m 0
" delete even line 删除偶数行
" :g/^/+1 d
nnoremap td :r !date<CR>
" :r !date 在当前行中插入当前日期和时间


" =====
" ===== markdown config
" =====
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0
" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1,
			\ 'sequence_diagrams': {}
			\ }
" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''
" use a custom port to start server or random for empty
let g:mkdp_port = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'


"" ===
"" === fzf-preview.vim
"" ===
"noremap <C-w> :BuffersPreview<CR>
"let g:fzf_preview_default_key_bindings = 'ctrl-e:down,ctrl-u:up'
"let g:fzf_preview_layout = 'belowright split new'
"let g:fzf_preview_rate = 0.4
"let g:fzf_full_preview_toggle_key = '<C-f>'
"let g:fzf_preview_command = 'ccat --color=always {-1}'
"let g:fzf_binary_preview_command = 'echo "It is a binary file"'


" ===
" === Ultisnips
" ===
"let g:tex_flavor = "latex"
"inoremap <c-n> <nop>
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-e>"
"let g:UltiSnipsJumpBackwardTrigger="<c-n>"
"let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', 'UltiSnips']
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>

"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
"let g:user_emmet_leader_key='<tab>'


"source $NVIMRC


" ===
" === tcomment_vim
" ===
" nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<
" :so % to restart vim


" ===
" === coc-translator
" ===
" NOTE: do NOT use `nore` mappings
" popup
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)
" echo
nmap <Leader>e <Plug>(coc-translator-e)
vmap <Leader>e <Plug>(coc-translator-ev)
" replace
nmap <Leader>rp <Plug>(coc-translator-r)
vmap <Leader>rp <Plug>(coc-translator-rv)

" Open up lazygit
" noremap \g :Git
" noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>


" ===
" === lazygit.nvim
" ===
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support

" ===
" === AutoFormat
" ===
nnoremap \f :Autoformat<CR>
nnoremap \l :AutoformatLine<CR>

" ===================== End of Plugin Settings =====================


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

