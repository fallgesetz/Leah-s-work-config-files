"Leah's vimrc 
" 3-6-2012 @ climate 
"General
"

"Gui
if has('gui_running')
	set guifont=Monospace:12
endif

" Mac copy and paste
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-p> :call setreg("\"",system("pbpaste"))<CR>p

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
let maplocalleader = "\\"

"want most completion options rather than let the dumb algorithm guess 
set wildmode=list:longest

"for screen and tmux, this is more informative 
set title

"search options 
set hlsearch 
set incsearch

"ack is prettier
set grepprg=ack-grep

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
"set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]\ %y
set laststatus=2
set showmode

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
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle "tslime.vim"
Bundle 'Tagbar'
Bundle 'vimclojure-2.3.1'
Bundle 'scrooloose/nerdtree'
Bundle 'surround.vim'
Bundle 'fugitive.vim'
Bundle 'ack.vim'
Bundle 'ervandew/screen'
Bundle 'trailing-whitespace'
Bundle 'bufexplorer.zip'
Bundle 'kevinstreit/VIM-Haskell'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/vim-statline'
Bundle 'micheljansen/vim-latex'
Bundle 'snipMate'
Bundle 'klen/python-mode'


filetype plugin indent on

color solarized
"NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFind<CR>

"Vim-LaTeX
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='open -a Preview'

"ScreenShell

nnoremap <C-c><C-c> :ScreenShell<cr>
vnoremap <C-c><C-c> :ScreenSend<cr>
nnoremap <C-c><C-x> :ScreenQuit<cr>

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


""""""""""""
" MAPPINGS "
""""""""""""

nnoremap <leader>p :call InsertPdbPython()<CR>

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

"Buffer Navigation
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

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
augroup END
