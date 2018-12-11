":nnoremap <Leader>java A// <C-R>=expand("%:t")<CR><CR><CR><Esc><Esc>0DA<CR>public class <CR>{<CR>public static void main(String[] args)<CR>{<CR>}<CR>}<Esc><Esc>5kA<C-R>=expand("%:t:r")<CR><Esc><Esc>3jo
:nnoremap <Leader>java A// <C-R>=expand("%:t")<CR><CR><CR><Esc><Esc>0DA<CR>public class  {<CR>public static void main(String[] args) {<CR>}<CR>}<Esc><Esc>3kA<Left><Left><C-R>=expand("%:t:r")<CR><Esc><Esc>j
:nnoremap <Leader>l oSystem.out.println();<Esc><Esc>hi
:nnoremap <Leader>r oSystem.out.print();<Esc><Esc>hi
:vnoremap <Leader>l :s/\%V\(.*\)/System.out.println(\1);<Esc><Esc>f; :nohlsearch<CR>
:vnoremap <Leader>r :s/\%V\(.*\)/System.out.print(\1);<Esc><Esc>f; :nohlsearch<CR>

:nnoremap <Leader>a :s/\(^\s*\)/\1\/\/ <CR>:nohlsearch<CR>
:vnoremap <Leader>a :s/\(^\s*\)/\1\/\/ <CR>:nohlsearch<CR>gv
:nnoremap <Leader>s :s/\(^\s*\)\/\/\s*/\1<CR>:nohlsearch<CR>
:vnoremap <Leader>s :s/\(^\s*\)\/\/\s*/\1<CR>:nohlsearch<CR>gv

:vnoremap <Leader>d :s/\%V\(.*\)\%V/\/*\1\*\/<CR>

:hi Type cterm=italic
:hi StorageClass cterm=italic
:hi Operator ctermfg=33 cterm=italic,bold

:syn match javaType /\<String\>/

:nnoremap <Leader>gsgs :s/\(\w\+\)\s\+\(\w\+\)\s*=.*$/&\r\r  public \1 get\u\2() {\r    return this.\2;\r  }\r\r  public void set\u\2(\1 \2_) {\r    this.\2 = \2_;\r  }<CR><CR>:nohlsearch<CR>8k
