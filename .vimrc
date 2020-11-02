"" general
call pathogen#infect()

set nocompatible
filetype plugin indent on
syntax on

"" editing
set textwidth=120
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set selection=inclusive
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
set undolevels=1000
set wrapmargin=2
set modelines=10

" folding/completion
set completeopt=menu,menuone
set foldmethod=syntax
set foldminlines=6
set foldlevel=5

" UI
set background=dark
set display=uhex
set history=50
set hlsearch
set incsearch
set list
set listchars=trail:^,tab:`_
set matchtime=2
set ruler
set scroll=10
set scrolloff=4
set showcmd
set showmatch
set suffixes+=.bak,~,.o,.h,.info,.swp,.obj,.bkup
set wildmenu

"" mapping and alike
" mappings
map Q :wq!
map <TAB> za
map <S-TAB> zA
map <C-SPACE> <C-x><C-o>

" open a new file in the same path as the current one
map ,e :tabedit <C-R>=expand("%:p:h") . "/" <CR>

" plugin settings
let OmniCpp_ShowPrototypeInAbbr = 1

let g:user_emmet_settings = {
\  'indentation' : '  ',
\  'perl' : {
\    'aliases' : {
\      'req' : 'require '
\    },
\    'snippets' : {
\      'use' : "use strict\nuse warnings\n\n",
\      'warn' : "warn \"|\";",
\    }
\  }
\}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
