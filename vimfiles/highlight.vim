" highlight clear SignColumn      " SignColumn should match background
" highlight clear LineNr          " Current line number row will have same background color in relative mode

" highlight Conceal guibg=NONE guifg=red

" make background transparent
" hi Normal guibg=NONE ctermbg=NONE
hi Normal ctermbg=NONE

" to enable proper italics rendering in terminal
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
