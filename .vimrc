"Leah's vimrc 
"General
"
" Useful Resources:
" http://zmievski.org/files/talks/codeworks-2009/vim-for-php-programmers.pdf
" Derek Wyatt's vimrc
" https://github.com/derekwyatt/vim-config/blob/master/vimrc

"Gui
if has('gui_running')
	set guifont=Monospace:12
endif

"enable mouse
set mouse=a

" Many a man fails as an original thinker simply because his memory is too good. -Nietzsche
"you know, command line history
set history=1000

"virtualedit
"cursor doesn't just snap to text
set virtualedit=all
set showmode

"use  per-directory exuberant ctags
set tags=./tags;/

"current buffer can be put to background without writing to disk 
"marks and undos are remembered when a background process is foregrounded 
set hidden

"no pinky jumps (default leader is \) 
let mapleader = ","
let maplocalleader = "\\"

"want most completion options rather than let the dumb algorithm guess 
set wildmode=list:longest

"for screen and tmux, this is more informative 
set title

"search options 
set hlsearch 
set incsearch
set wrapscan "wrap around search

"ack is prettier
set grepprg=ack-grep

"General aesthetics

set background=dark
set guifont=Monaco:h18
let g:solarized_termcolors=16 "need this for something?

set number 
syntax enable

"WOOOOOO, PUNCH CARDS
"annoying, breaks python - 06/29/2011
set textwidth=80
set wrap linebreak textwidth=0

"backspace
set backspace=2

"Omnicompletion
set ofu=syntaxcomplete#Complete

"Informative status line(copied) 
"from Derek Wyatt's blog
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]\ %y
" set laststatus=2
" set showmode

"Window movement keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"LaTeX 
set grepprg=grep\ -nH\ $* 
let g:tex_flavor='latex'

"Package Management 
" switch to Vundle
" install with:  $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'wincent/Command-T'
Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle "tslime.vim"
Bundle 'Tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'surround.vim'
Bundle 'fugitive.vim'
Bundle 'ack.vim'
Bundle 'trailing-whitespace'
Bundle 'bufexplorer.zip'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/vim-statline'
Bundle 'micheljansen/vim-latex'
Bundle 'snipMate'
Bundle 'Conque-Shell'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-flake8'
Bundle 'lukerandall/haskellmode-vim'

filetype plugin indent on

color solarized
"NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFind<CR>
let g:NERDTreeDirArrows=0

"Vim-LaTeX
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='open -a Preview'

" Conqueterm
" http://code.google.com/p/conque/wiki/Usage
let g:ConqueTerm_color = 1
let g:ConqueTerm_InsertOnEnter = 1


"Command-T
let g:CommandTMaxFiles=10000
let g:CommandTMaxDepth=10
let g:CommandTMaxCachedDirectories=3

"Ack-grep
let g:ackprg="ack-grep"

"VimClojure
let vimclojure#HighlightBuiltins=1
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1

"statline
let g:statline_fugitive=1

"klen/python-mode
let g:pymode_folding=0

""""""""""""""""""""
" Custom Functions "
""""""""""""""""""""

function! InsertPdbPython()
	let trace = expand("import pdb; pdb.set_trace()")
	execute "normal o".trace
endfunction

function! InsertHphpBreak()
	let trace = expand("hphpd_break();")
	execute "normal o".trace
endfunction

""""""""""""
" MAPPINGS "
""""""""""""

nnoremap <leader>p :call InsertPdbPython()<CR>
nnoremap <leader>pb :call InsertHphpBreak()<CR>

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


"vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"esc
inoremap jj <esc>

"Window navigation
noremap <silent> <C-h> :wincmd h<CR>
noremap <silent> <C-l> :wincmd l<CR>
noremap <silent> <C-j> :wincmd j<CR>
noremap <silent> <C-k> :wincmd k<CR>

""""""""""""""""""""
" FILETYPE COMMANDS"
""""""""""""""""""""
augroup filetypeindent
    autocmd!
    autocmd BufRead, BufNewFile *.sage, *.pyx, *.spyx set filetype=python
augroup END

augroup indent_rules
    "clear autocmds in group on reload
    autocmd! 
    autocmd FileType python setlocal ai tabstop=4 expandtab shiftwidth=4 backspace=indent
    autocmd FileType clojure setlocal expandtab ai tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype c setlocal tabstop=4 shiftwidth=4 expandtab cindent
    autocmd Filetype php setlocal shiftwidth=2 expandtab tabstop=2 softtabstop=2 cindent
augroup END

""""""""""""""""""
" Facebook Stuff " 
" """"""""""""""""

source /home/engshare/admin/scripts/vim/biggrep.vim
  augroup filetypedetect
  au! BufRead,BufNewFile *.phpt setfiletype php
augroup END
