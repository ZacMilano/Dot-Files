:nnoremap <Leader>i i[ ] 
:nnoremap <Leader>a a[ ] 
:nnoremap o o[ ] 
:nnoremap O O[ ] 
:nnoremap <Leader>p :s/^\(\s*\)\[ \]/\1[✓]/<CR>
:nnoremap <Leader>; :s/^\(\s*\)\[[✓x]\]/\1[ ]/<CR>
:vnoremap <Leader>p :s/^\(\s*\)\[ \]/\1[✓]/<CR>
:vnoremap <Leader>; :s/^\(\s*\)\[[✓x]\]/\1[ ]/<CR>

:set nohlsearch

:hi ToDoNotDone ctermfg=232 ctermbg=33
:syntax match ToDoNotDone /\[ \]/
:hi ToDoDone ctermfg=242
:syntax match ToDoDone /\[[✓x]\].*/
