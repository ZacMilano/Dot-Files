:nnoremap <Leader>l oprint()<Esc><Esc>i
:nnoremap <Leader>r iprint()<Esc><Esc>i
:vnoremap <Leader>l :s/\%V\(.*\)/print(\1)<Esc><Esc> :nohlsearch<CR>
:syntax keyword Operator lambda conceal cchar=λ
  \ | hi! link Conceal Operator
  \ | set conceallevel=2

:nnoremap <Leader>a :s/\(^\s*\)/\1# <CR>:nohlsearch<CR>
:vnoremap <Leader>a :s/\(^\s*\)/\1# <CR>:nohlsearch<CR>gv
:nnoremap <Leader>s :s/\(^\s*\)# /\1<CR>:nohlsearch<CR>
:vnoremap <Leader>s :s/\(^\s*\)# /\1<CR>:nohlsearch<CR>gv

"syn region FCall start='[[:alpha:]_]\i*\s*(' end=')' contains=FCallKeyword
"syn match FCallKeyword /\i*\ze\s*=[^=]/ contained
"hi FCallKeyword ctermfg=9
"syn match pythonDotOperator \"\." display contained
"syn match pythonKwarg \"\<\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\ze\s*=" display contains=pythonDotOperator contained
"hi pythonKwarg ctermfg=33
"hi pythonDotOperator ctermfg=33
