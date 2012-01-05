""""""""""""""""" "Leah's vimrc "October 16th, 2011 """""""""""""""""
"General

"yy p D P works with system clipboard
"doesn't really work
"set clipboard=unnamed

"virtualedit
"cursor doesn't just snap to text
set virtualedit=all

set showmode

"use  per-directory exuberant ctags
set tags=tags;/

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
set hlsearch 
set incsearch

"ack is prettier
set grepprg=ack

"General aesthetics

set background=dark	
set guifont=Monaco:h18
let g:solarized_termcolors=16

set number 
syntax enable

"WOOOOOO, PUNCH CARDS
"annoying, breaks python - 06/29/2011
set textwidth=80 
set wrap linebreak textwidth=0


"Omnicompletion
set ofu=syntaxcomplete#Complete

"Informative status line(copied) 
"from Derek Wyatt's blog
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set laststatus=2

"Spellchecking 
"set spell 
"set spelllang=en 
"set spellsuggest=9

"Plugins 
filetype plugin on
filetype indent on

"Python 
"let python_highlight_builtin = 1

"LaTeX 
set grepprg=grep\ -nH\ $* 
let g:tex_flavor='latex'

"Package Management 
call pathogen#runtime_append_all_bundles("vimpyre")

" Solarized
" keep this after pathogen, because solarized requires pathogen
color solarized

""""""""""""
" MAPPINGS "
""""""""""""

"arrow keys - don't cheat
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"makes highlight search much less annoying
nnoremap <silent> <F3> :set hlsearch!<CR>

"Tagbar 
nnoremap <silent> <F8> :TagbarToggle<CR>

"NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>

"vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"esc
inoremap jj <esc>

"Buffer Navigation
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

""""""""""""""""""""
" FILETYPE COMMANDS"
""""""""""""""""""""

augroup indent_rules
    "clear autocmds in group on reload
    autocmd! 
    autocmd FileType python setlocal noai tabstop=4 expandtab shiftwidth=4 backspace=indent
    autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab cindent
    autocmd FileType ocaml setlocal sw=2 noai
augroup END


