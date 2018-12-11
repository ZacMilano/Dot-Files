:nnoremap <Leader>js A/* Zac Monroe<CR><C-R>=expand("%:t")<CR><CR>File created: <C-R>=strftime('%c')<CR><Esc><Esc>oLast changed: Fri 19 Oct 2018 12:05:18 PM EDT
:nnoremap <Leader>time :1,5s/\(Last changed: Fri 19 Oct 2018 12:05:18 PM EDT
":nnoremap <Leader>timq :1,5s/\(Last changed: Fri 19 Oct 2018 12:05:18 PM EDT
:cnoremap wq<CR> :1,5s/\(Last changed: Fri 19 Oct 2018 12:05:18 PM EDT

:hi link javaScriptIdentifier StorageClass
:hi link javaScriptBraces Normal
:hi link javaScriptValue Number
:syn match javaScriptPrint /console.log/
:hi link javaScriptPrint Function
