set nocompatible              " required
filetype plugin on                  " required
syntax on

:let mapleader = " "

set backspace=indent,eol,start

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <Leader>b za

Plugin 'tmhedberg/SimpylFold'

au BufNewFile,BufRead *
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

au BufNewFile,BufRead *.todo
      \ so ~/.vim/todo.vim

au BufNewFile,BufRead *.java
      \ so ~/.vim/java.vim

au BufNewFile,BufRead *.py
      \ so ~/.vim/python.vim

au BufNewFile,BufRead *.js
      \ so ~/.vim/javascript.vim

Plugin 'vim-scripts/indentpython.vim'

set encoding=utf-8
set showmatch

Bundle 'Valloric/YouCompleteMe'

Plugin 'nvie/vim-flake8'

let python_highlight_all=1

set number

Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let NERDTreeShowHidden=1
let g:NERDTreeWinPos = 'left'

" Toggle a nerdtree with ctrl-n
nnoremap <C-n> :NERDTreeToggle<CR>

" Close vim if a nerdtree is the only thing open
autocmd bufenter * if (winnr("$") == 3 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"set statusline+=%*

noremap j gj
noremap k gk

set hlsearch
set incsearch
set ignorecase
set smartcase

nnoremap <CR> :nohlsearch<cr>

set relativenumber

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" For having the vertical bar cursor in insert mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" For auto-formatting the file
map <F7> mzgg=G`z

" For centering the search result on the screen
:nnoremap <Leader>n nzz
:nnoremap <Leader>N Nzz

" Always use very magic when searching/replacing
:nnoremap / /\v
:cnoremap %s %s/\v

" Always globally substitute
:set gdefault
:set edcompatible

" To add a blank line before or after the cursor
:nnoremap <Leader>o o<Esc>
:nnoremap <Leader>O O<Esc>

" Use this color config
":so ~/.vim/hi_0.vim
:so ~/.vim/hi_1.vim

":nnoremap <Leader>f o{}<Esc><Esc>i<CR><Esc><Esc>O
:nnoremap <Leader>f A {}<Esc><Esc>i<CR><Esc><Esc>O

:inoremap jk <Esc><Esc>


" Move lines in visual mode with J and K
:vnoremap J :m '>+1<CR>gv
:vnoremap K :m '<-2<CR>gv

" Re-highlight lines after indenting or unindenting
:vnoremap > >gv
:vnoremap < <gv

" Make it super simple to get out of visual mode
:vnoremap <Leader><Leader> <Esc><Esc>

" remove all whitespace at the end of lines
:nnoremap <Leader>` :%s/\s\+$//g<CR>

:cnoremap ;\ \(\)<Left><Left>

function! ChangeStatusLineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=33'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=171'
  elseif mode() == 'i' || mode() == 'r'
    exe 'hi! StatusLine ctermfg=49'
  elseif mode() == 'c'
    exe 'hi! StatusLine ctermfg=50'
  endif

  return ''
endfunction


" Statusline stuff

" :h mode() to see all modes
let g:currentmode={
    \ 'n'      : 'N ',
    \ 'no'     : 'N·Operator Pending ',
    \ 'v'      : 'V ',
    \ 'V'      : 'V·Line ',
    \ '\<C-V>' : 'V·Block ',
    \ '\\^V'     : 'V·Block ',
    \ 'CTRL-V' : 'V·Block ',
    \ 's'      : 'Select ',
    \ 'S'      : 'S·Line ',
    \ '\<C-S>' : 'S·Block ',
    \ 'i'      : 'I ',
    \ 'R'      : 'R ',
    \ 'Rv'     : 'V·Replace ',
    \ 'c'      : 'Command ',
    \ 'cv'     : 'Vim Ex ',
    \ 'ce'     : 'Ex ',
    \ 'r'      : 'Prompt ',
    \ 'rm'     : 'More ',
    \ 'r?'     : 'Confirm ',
    \ '!'      : 'Shell ',
    \ 't'      : 'Terminal '
    \}

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
  endfunction

set laststatus=2
set statusline=
"set statusline+=%{ChangeStatusLineColor()}
"set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%8*\ [%n]                                " buffernr
"set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
set statusline+=%8*\ %<%f\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}             " Syntastic errors
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
"set statusline+=%8*\ %y\                                 " FileType
"set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\  " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
"set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
set statusline+=%0*\ %3p%%\ C:%3c\                 " Rownumber/total (%)


hi User1 ctermfg=245
hi User2 ctermfg=245
hi User3 ctermfg=245
hi User4 ctermfg=245
hi User5 ctermfg=245
hi User7 ctermfg=245
hi User8 ctermfg=245
hi User9 ctermfg=245

" hi User1 ctermfg=009
" hi User2 ctermfg=009
" hi User3 ctermfg=009
" hi User4 ctermfg=009
" hi User5 ctermfg=009
" hi User7 ctermfg=009
" hi User8 ctermfg=009
" hi User9 ctermfg=009
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

autocmd FileType vim let b:vcm_tab_complete= 'omni'
":inoremap <C-O> <C-X><C-O>

:nnoremap <Leader>, <C-W><
:nnoremap <Leader>. <C-W>>

:inoremap <C-E> <C-X><C-E>
:inoremap <C-Y> <C-X><C-Y>
:inoremap <C-Z> <Esc><Esc>zza

