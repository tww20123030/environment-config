" Self Config

if has ("unix")
	let $EX_DEV='~/.vim'
	let g:ex_toolkit_path = $HOME. '/.vim/.tookit'

" Mac is unix like system, but to use gawk, id-utils correctly, we still need
" to manually set the export path.
	if has ("mac")
		let $PATH='/usr/local/bin/:' .$PATH
	endif

else 
	" Win32 or other so, set toolkit path
	let g:ex_toolkit_path = $EX_DEV.'/tools/exvim/toolkit'
endif

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

let g:ex_usr_name = "tww"

"Execute Pathogen
execute pathogen#infect()
"call pathogen#incubate("after")

""""""""""""""""""""""""""""""""""""""General""""""""""""""""""""""""""""""
" Get out of vi mode"
set nocompatible

" Enable mouse usage (all modes),like select and paste
"set mouse=i	

"Set how many lines of history VIM har to remeber
set history=400

" Set to auto read when a file is modified from the outside
set autoread

" Jump to the last position when reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Load indentation rules and plugins according to the detected filetype.
filetype plugin indent on

" Move swp file to tmp
set directory=~/tmp,/tmp

nnoremap <F2> :set nonumber!<CR>:set foldcolum=0<CR>
nnoremap <F7> :TagbarToggle<CR>
nnoremap <F8> :NERDTree<CR>
""""""""""""""""""""""""""""""""Indent""""""""""""""""""""""""""""""""""""""
" Use ~/.vim/after/ftplugin/*.vim to define this

""""""""""""""""""""""""""""""""Own filetype""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.txt    set filetype=txt	

""""""""""""""""""""""""""""""Paste and Clipboard"""""""""""""""""""""""""""
" Set default clipboard is system clipboard(Avaliable in Mac)
"set clipboard=unnamedplus

" Let yank and delete use different regs
" Cut/delete use *reg
" Yank/Copy use +reg(unnamedplus)
" Visual/Insert/Normal mode Non-Recursive MAP
"vnoremap y "+y
"vnoremap d "*d
"nnoremap yy "+Y
"nnoremap Y "+Y

"""""""""""""""""""""""""""""""""""""Add Chinese""""""""""""""""""""""""""""
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

"""""""""""""""""""""""""""""""""""""Colors and Fonts"""""""""""""""""""""""
" Use a dark background
set background=dark

"Color Themes (Need console support color256)
let g:molokai_original = 1
colorscheme molokai

"""""""""""""""""""""""""""""""""""""Text Option""""""""""""""""""""""""""""
" Enable syntax highlight
syntax enable
if has("syntax")
  syntax on
endif

" Enable folding
set nofen
set fdl=0
" Use spaces instead tab
set expandtab
" Show matching brackets.
set showmatch		
set backspace=2

"imap <C-H> <Left><Del>

"""""""""""""""""""""""""""""""""""""MultiWindows"""""""""""""""""""""""
" Always show status of last window
set laststatus=2

" Ruler (x,y)
set ruler

"Show Line Number"
set number

" Quick move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"""""""""""""""""""""""""""""""""""""Command Line"""""""""""""""""""""""""""
" Show (partial) command in status line.
set showcmd		

" Show current vim mode
set showmode

"""""""""""""""""""""""""""""""""""""Search"""""""""""""""""""""""""""""""
" Incremental search
set incsearch		

"Highlight Search"
set hlsearch

"nnoremap <F4> :Rgrep --include="*.c" --include="*.h" --include="*.S"<CR>

""""""""""""""""""""""""""""""""""""""Other"""""""""""""""""""""""""""""""
"Enter or Exit paste mode
set pastetoggle=<F11>
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandonedo

if &term=="xterm"
	set t_Co=256
	set t_Sb=^[[4%dm
	set t_Sf=^[[3%dm
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
nnoremap <silent><leader>t :NERDTreeToggle<cr>

" FufSearch
nnoremap <silent><leader>f :FufFile<cr>
"nnoremap <silent><leader>ft :FufTag<cr>

" TagBar
nnoremap <silent><leader>b :TagbarToggle<cr>

" syntastic close location list
nnoremap <silent><leader>l :lclose<cr>


"""""""""""""""""""""""""""""""""""""Ctags""""""""""""""""""""""""""""""""""""""

"For ctags, so it can find 'tags' file even not in current directory

nmap <F6> :!ctags -R --c++-kinds=+p --fields=+aimS --extra=+q .<CR><CR>:!ftags<CR><CR>:TlistUpdate<CR>
nmap <F6> :!ctags -R --c++-kinds=+p --fields=+iamS --extra=+q .<CR><CR>:!ftags<CR><CR>:TlistUpdate<CR>

set tags=tags
"set tags+=./tags
"set tags+=/usr/include/c++/tags
"set tags+=/usr/src/linux-source-3.16/tags
"set tags+=/usr/src/linux-headers-3.16.0-4-amd64/tags

"Scala Tags
set tags+=./.tags,.tags


"""""""""""""""""""""""""""""""""OmniCppComplete""""""""""""""""""""""""""""""""
"-- omnicppcomplete setting --
"按下F3自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F3会自动补全一些乱码
"整行补全                        CTRL-X CTRL-L
"根据当前文件里关键字补全        CTRL-X CTRL-N
"根据字典补全                    CTRL-X CTRL-K
"根据同义词字典补全              CTRL-X CTRL-T
"根据头文件内关键字补全          CTRL-X CTRL-I
"根据标签补全                    CTRL-X CTRL-]
"补全文件名                      CTRL-X CTRL-F
"补全宏定义                      CTRL-X CTRL-D
"补全vim命令                     CTRL-X CTRL-V
"用户自定义补全方式              CTRL-X CTRL-U
"拼写建议                        CTRL-X CTRL-S 
imap <F3> <C-X><C-O>
" 按下F2根据头文件内关键字补全
imap <F2> <C-X><C-I>
set completeopt=menu,menuone " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot=1 " autocomplete with .
let OmniCpp_MayCompleteArrow=1 " autocomplete with ->
let OmniCpp_MayCompleteScope=1 " autocomplete with ::
let OmniCpp_SelectFirstItem=2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch=2 "search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr=1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1

""""""""""""""""""""""""""""""""""""""TagList"""""""""""""""""""""""""""""""""""""
"-- Taglist setting --
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "0:left 1:right
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0
"""""""""""""""""""""""""""""""""Lookupfile"""""""""""""""""""""""""""""""""""""
let g:LookupFile_TagExpr = '"./filenametags"'

""""""""""""""""""""""""""""""""EchoFunctions"""""""""""""""""""""""""""""""""""
let g:EchoFuncKeyPrev='–'
let g:EchoFuncKeyNext='≠'
set statusline+=%{EchoFuncGetStatusLine()}

"""""""""""""""""""""""""""""""""""""Syntastic"""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_disabled_filetypes=['html']
let g:syntastic_quiet_messages = {
        \ "!level":  "errors",
        \ "type":    "style",
        \ "regex":   '\m\[C03\d\d\]',
        \ "file:p":  ['\m^/usr/include/', '\m\c\.h$'] }

""""""""""""""""""""""""""""""""""""Markdown"""""""""""""""""""""""""""""""""""""
let g:instant_markdown_slow = 1

""""""""""""""""""""""""""""""""""""Vim-Latex"""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""View"""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""Slime"""""""""""""""""""""""""""""""""""""""""
let g:slime_target = "tmux"
"let g:slime_default_config = {"default:default:1,1"}
" tmux target pane: h:i,j
" h-> session identifier; i->window; j->pane

" Maybe text can't sent through STDIN directly, Then use a file:
"let g:slime_paste_file = \"$HOME/.slime_paste\"
" or 
"let g:slime_paste_file = tempname()
"

"""""""""""""""""""""""""""""""""""OPAM+Merlin""""""""""""""""""""""""""""""""
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
"execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"
"let g:syntastic_ocaml_checkers = ['merlin']


