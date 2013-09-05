"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
".vimrc by Youbei:

"<F2>: grep.vim
"<C-F2>: Toggle buttoms in GVIM
"<F3>: Toggle NERD_tree.vim
"<F4>: Toggle muickview
"<F5>: make
"<F6>: shell conque_term.vim
"<F7>: Toggle tagbar.vim
"<F8>: Fold/Un-Fold
"<F9>: pastetoggle
"<F11>: Spell checking

"tt/<C-t>: create new tab
"tc: close current tab
"tn/tp: next buffer, prev buffer
"tn/tp: next tab, prev tab
"{N}gt: goto the Nth tab
"wh,wj,wk,wl: window nav
"gp: format chinese paragraph
"<C-_>: close matching open tag
"<C-y>,: Expand Abbreviation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Language settings
let &termencoding=&encoding
set fileencodings=utf-8,ucs-bom,cp936,latin1
set encoding=utf-8

"Windows compatible
if has("win32")
    set termencoding=cp936
    language messages zh_CN.UTF-8
endif

set display=lastline

"stop blink
set gcr=a:block-blinkon0

set nocp
set ru
set cin
"subtitute with magic
set sm
"auto indent
set ai
"paste
set pastetoggle=<F9>

"tab stop & shift width
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

"code fold
autocmd FileType python,coffee setlocal foldmethod=indent
set foldlevel=99
map <F8> za

"show line number
set number

set cinoptions=:0g0(sus

"linebreak, when the 'wrap' is on, display a character in 'breakat' rather than at the last character that fits on screen
set lbr

"hlsearch, Highlight all items matched by search pattern
set hls

set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
"create a fold for the lines in {range} ?
set fo+=mB
set mousemodel=popup
"last character will be included in selection
set selection=inclusive
"command-line completion operates...
set wildmenu
set smarttab
"Use twice the width of ASCII characters in Unicode encoding
set ambiwidth=double
"name of tags file
set tags=tags;
"这个命令让vim首先在当前目录里寻找tags文件, 否则再向父目录找
set autochdir

set mouse=a
"set mouse=v

set nocompatible

highlight Pmenu guibg=#6311b0
highlight PmenuSel guibg=#bac2ff gui=bold guifg=#000000

"Move lines
nmap <C-Down> :<C-u>move .+1<CR>
nmap <C-Up> :<C-u>move .-2<CR>
imap <C-Down> <C-o>:<C-u>move .+1<CR>
imap <C-Up> <C-o>:<C-u>move .-2<CR>
vmap <C-Down> :move '>+1<CR>gv
vmap <C-Up> :move '<-2<CR>gv

"Toggle spell check
"For VIM7 only
nmap <F11> :set spell!<CR>
imap <F11> <C-o>:set spell!<CR>

"Window Movement
nmap wn <C-w>n
nmap wv <C-w>v
nmap wh <C-w>h
nmap wj <C-w>j
nmap wk <C-w>k
nmap wl <C-w>l



"Plugins settings

"NERDTree
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"Grep
nnoremap <silent> <F2> :Grep<CR>

"ConqueTerm
nnoremap <silent> <F6> :ConqueTermVSplit bash <CR>

"Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_width = 30
let g:tagbar_left = 1
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
nmap <silent> <F7> :TagbarToggle<CR>

"Super Tab
let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabCompletionContexts = ['s:ContextText']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctags and cscope and make
set cscopequickfix=s-,c-,d-,i-,t-,e-
map <leader>cs <ESC>:!cscope -Rbq<CR>
map <leader>ct <ESC>:!ctag -R .<CR>
autocmd FileType python map <F5> <ESC>:!python %:p<CR>
autocmd FileType go map <F5> <ESC>:!go install
autocmd FileType javascript map <F5> <ESC>:!js %:p<CR>
autocmd FileType html map <F5> <ESC>:!firefox %:p<CR>
"autocmd FileType html map <F5> <ESC>:w<CR>
"autocmd FileType css map <F5> <ESC>:w<CR>
autocmd FileType c map <F5> <ESC>:make<CR>
autocmd FileType cpp map <F5> <ESC>:make<CR>
autocmd FileType coffee map <F5> <ESC>:CoffeeMake<CR>
autocmd FileType less map <F5> <ESC>:!lessc %:p > %<.css <CR>
autocmd FileType coffee map <F6> <ESC>:CoffeeCompile vertical<CR>

autocmd FileType tex map <F2>   <ESC>:w<CR>\ll   
autocmd FileType tex imap <F2>   <ESC>:w<CR>\ll
autocmd FileType tex map <F3>   <ESC>\lv                  
autocmd FileType tex imap <F3>   <ESC>\lv
autocmd FileType tex nmap <Tab>  <C-j>                    
autocmd FileType tex imap <Tab>  <C-j>
autocmd FileType tex vmap <Tab>  <C-j>


"Quick Fix
function! ToggleQF()
    if !exists("g:fx_toggle")
        let g:fx_toggle = 0
    endif
    if g:fx_toggle == 0
        let g:fx_toggle = 1
        copen
    else
        let g:fx_toggle = 0
        cclose
    endif
endfunc
map <F4> <ESC>:call ToggleQF() <CR>

"Status line
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [ASC:\%03.3b]\ [%p%%]\ [LEN=%L]
set laststatus=2

"Tab control
noremap <C-t> <ESC>:tabnew<CR>
noremap tt <ESC>:tabnew<CR>
noremap tc <ESC>:tabclose<CR>
noremap <S-l> <ESC>:tabnext<CR>
noremap <S-h> <ESC>:tabp<CR>

"omno complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
set completeopt+=longest
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For GVIM

if (has("gui_running"))
    "Open NERDTree when opening
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
    "Remove Menu and Toolbar
    set guioptions-=T "remove toolbar
    set guioptions-=m "remove menubar

    map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <Bar>
        \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
        \endif<CR>

    "Remove scroll bar
    set guioptions+=RrLlb
    set guioptions-=RrLlb
	set guifont=sourcecodepro\ 13
    set lazyredraw
    colo desert
else
    colo default
endif

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"latex-pdf REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"let g:Tex_DefaultTargetFormat='pdf'

let g:Tex_ViewRule_pdf='evince'

