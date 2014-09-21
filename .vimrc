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

"<ESC> == jj
inoremap jj <ESC>
set nocp
set ru
"subtitute with magic
set sm
"no auto indent
set nocindent
set nosmartindent
set noautoindent
filetype indent on
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


"Hightlight .ejs files
au BufNewFile,BufRead *.ejs set filetype=html

"Plugins settings

"NERDTree
nnoremap <silent> <F3> :NERDTreeTabsToggle<CR>

"Grep
nnoremap <silent> <F2> :Grep<CR>

"ConqueTerm
nnoremap <silent> <F6> :ConqueTermVSplit bash <CR>

"Pathogen
call pathogen#infect()

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
autocmd FileType html map <F5> <ESC>:w<CR>
autocmd FileType css map <F5> <ESC>:w<CR>
autocmd FileType c map <F5> <ESC>:make<CR>
autocmd FileType cpp map <F5> <ESC>:make<CR>
autocmd FileType coffee map <F5> <ESC>:CoffeeMake<CR>
autocmd FileType less map <F5> <ESC>:!lessc %:p > %<.css <CR>
autocmd FileType coffee map <F6> <ESC>:CoffeeCompile vertical<CR>



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
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType c set omnifunc=ccomplete#Complete
set completeopt+=longest
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For GVIM
if (has("gui_running"))
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
	set guifont=Monaco:h14
    set lazyredraw
    syntax enable
    set background=dark
    colorscheme solarized
else
    colorscheme default
endif

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Making Parenthesis And Brackets Handling Easier
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
"Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
"Escaping out of the string
 return "\<Right>"
 else
"Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf
