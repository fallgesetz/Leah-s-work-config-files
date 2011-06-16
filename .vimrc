"""""""""""""""""
"Leah's vimrc
"June 16th, 2011
"""""""""""""""""

"General aesthetics

set t_Co=256
color desert256

set number
syntax enable

"Indentation
set smartindent
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

filetype indent on 

"Informative status line(copied)
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
set laststatus=2

"Spellchecking
set spell
set spelllang=en
set spellsuggest=9

"Plugins
filetype plugin on

"Python
let python_highlight_builtin = 1

"LaTeX
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

"Package Management
call pathogen#runtime_append_all_bundles("vimpyre")
