""""""""""""""""" "Leah's vimrc "June 16th, 2011 """""""""""""""""
"General

"current buffer can be put to background without writing to disk 
"marks and undos are remembered when a background process is foregrounded 

set hidden

"no pinky jumps (default leader is \) 
let mapleader = ","

"want most completion options rather than let the dumb algorithm guess 
set wildmode=list:longest

"for screen and tmux, this is more informative 
set title

"search options 
"set hlsearch 
set incsearch

"ack is prettier
set grepprg=ack

"General aesthetics

if has ("gui_running")
	set guifont=Monaco:h18
endif

set t_Co=256 
color xoria256

set number 
syntax enable

"Indentation 
set smartindent 
set autoindent 
set tabstop=4 
set expandtab 
set shiftwidth=4 
set softtabstop=4 
set backspace=indent,eol,start

"WOOOOOO, PUNCH CARDS
"annoying, breaks python - 06/29/2011
set textwidth=80 
set wrap linebreak textwidth=0


"Omnicompletion
set ofu=syntaxcomplete#Complete

filetype indent on

"Informative status line(copied) 
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)] 
set laststatus=2

"Spellchecking 
"set spell 
"set spelllang=en 
"set spellsuggest=9

"Plugins 
filetype plugin on

"Python 
let python_highlight_builtin = 1

"LaTeX 
set grepprg=grep\ -nH\ $* 
let g:tex_flavor='latex'

"Package Management 
call pathogen#runtime_append_all_bundles("vimpyre")

"Taglist 
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F1> :NERDTreeToggle<CR>
