if &compatible
  set nocompatible
endif

" ================ Plugins ==================== {{{
" install vim-plug automatically if missing
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" location for plugins to be installed
call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-unimpaired'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug  'FelikZ/ctrlp-py-matcher'
Plug 'ctrlpvim/ctrlp.vim'
Plug  'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'rstacruz/vim-closer'
Plug 'andymass/vim-matchup'
Plug 'mhinz/vim-sayonara'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'

call plug#end()
" ================ Nvim-specific Config ==================== {{{
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" }}}
" ================ General Config ==================== {{{
let mapleader=" "
let maplocalleader=" "
set clipboard^=unnamed,unnamedplus                                              "Copy to system clipboard
set termguicolors
set title                                                                       "change the terminal's title
set history=500                                                                 "Store lots of :cmdline history
set termguicolors
set noshowmode                                                                  "Hide showmode
set gdefault                                                                    "Set global flag for search and replace
set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
"set timeoutlen=1000 ttimeoutlen=0                                               "Reduce Command timeout for faster escape and O
set notimeout
set ttimeout
set ttimeoutlen=10
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set background=dark                                                             "Set background to dark
set hidden                                                                      "Hide buffers in background
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
set path+=**                                                                    "Allow recursive search
set inccommand=nosplit                                                          "Show substitute changes immidiately in separate split
set fillchars+=vert:\│                                                          "Make vertical split separator full line
set pumheight=15                                                                "Maximum number of entries in autocomplete popup
set exrc                                                                        "Allow using local vimrc
set secure                                                                      "Forbid autocmd in local vimrc
set grepprg=rg\ --vimgrep                                                       "Use ripgrep for grepping
set tagcase=smart                                                               "Use smarcase for tags
set updatetime=500                                                              "Cursor hold timeout
set synmaxcol=300                                                               "Use syntax highlighting only for 300 columns
set shortmess+=c                                                                "Disable completion menu messages in command line
set undofile                                                                    "Keep undo history across sessions, by storing in file
set completeopt-=preview                                                        "Disable preview window for autocompletion

filetype plugin indent on
syntax on
silent! colorscheme dracula

" }}}
" ================ Turn Off Swap Files ============== {{{
 set noswapfile
 set nobackup
 set nowritebackup

" }}}
" ================ Indentation ====================== {{{
 set shiftwidth=2
 set softtabstop=2
 set tabstop=2
 set expandtab
 set breakindent
 set smartindent
 set nofoldenable
"  set colorcolumn=80
 set colorcolumn=0
 set foldmethod=syntax

" }}}
" ================ Auto commands ====================== {{{
augroup vimrc
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow                                       "Open quickfix window after grepping
  autocmd InsertEnter * set nocul                                             "Remove cursorline highlight
  autocmd InsertLeave * set cul                                               "Add cursorline highlight in normal mode
  autocmd FocusGained,BufEnter * checktime                                    "Refresh file when vim gets focus
augroup END

" }}}
" ================ Completion ======================= {{{
set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*mypy_cache*
set wildignore+=*__pycache__*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" }}}
" ================ Scrolling ======================== {{{
set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" }}}
" ================ Custom mappings ======================== {{{
nnoremap <silent> <C-l> :nohlsearch<CR>
" Down is really the next line
nnoremap j gj
nnoremap k gk

" Map for Escape key
inoremap jj <Esc>
tnoremap <Leader>jj <C-\><C-n>

" map <Space> :
map Q :
map <leader><leader> :w<CR>

" Yank to the end of the line
nnoremap Y y$

"Disable ex mode mapping
" map Q <Nop>

map <leader>pi :PlugInstall<CR>
map <leader>pc :PlugClean<CR>
map <leader>pu :PlugUpdate<CR>

" ================ Plugins settings ======================== {{{
let g:deoplete#enable_at_startup = 1                                            "Enable deoplete on startup
let g:startify_custom_header = []

" CtrlP settings "{{{
let g:ctrlp_extensions = ['undo', 'dir']
let g:ctrlp_map = '<c-t>'
let g:ctrlp_open_multiple_files = '1jr'
let g:ctrlp_max_files = 0
let g:ctrlp_lazy_update = 50
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_match_window = 'bottom,order:btt,min:20,max:20,results:20'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
      \ 'file': '\.pyc$\|\.pyo$',
      \ }
let g:ctrlp_user_command = 'fd --type file --hidden --follow --exclude .git'

nnoremap <silent> <leader>b :CtrlPBuffer<cr>
nnoremap <silent> <leader>r :CtrlPMRUFiles<cr>
nnoremap <silent> <C-q> :CtrlP .<cr>
nnoremap <leader>d :Sayonara<cr>
" }}}

"}}} =======================================================

" Use local init.vim if available
if filereadable(expand("~/init.vim.local"))
  source ~/init.vim.local
endif
