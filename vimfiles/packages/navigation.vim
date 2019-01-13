" A vim script to provide CamelCase motion through words
Plug 'bkad/CamelCaseMotion'
map <silent> <leader>2 <Plug>CamelCaseMotion_w
map <silent> <leader>1 <Plug>CamelCaseMotion_b

Plug 'easymotion/vim-easymotion' "{{{
  map = <Plug>(easymotion-prefix)
  map <M-f> =f
  map <M-b> =F
"}}}

" Plugin to toggle, display and navigate marks
" m<Space> Delete all marks from the current buffer
" m/ Open location list and display marks from current buffer
" ]` Jump to next mark
" [` Jump to prev mark
Plug 'kshenoy/vim-signature'

" A simple function navigator for ctrlp.vim
Plug 'tacahiroy/ctrlp-funky' "{{{
  let g:ctrlp_funky_syntax_highlight = 1

  nnoremap <Leader>fu :CtrlPFunky<Cr>
  " narrow the list down with a word under cursor
  nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" }}}

" readline mappings in insert/command line mode
Plug 'tpope/vim-rsi'

Plug 'tpope/vim-vinegar'

" Ranger integration in vim and neovim
" Plug 'francoiscabrol/ranger.vim' "{{{
  " let g:ranger_map_keys = 0
  " let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
" }}}

" The BClose Vim plugin for deleting a buffer without closing the window
" (ranger.vim dependency to close buffer while opening directory in ranger)
" Plug 'rbgrouleff/bclose.vim' "{{{
  " let g:bclose_no_plugin_maps = 1
"}}}
