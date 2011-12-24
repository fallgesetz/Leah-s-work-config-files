alias pv="open -a preview"
alias vim='mvim -v'
alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="clean"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode brew compleat history-substring-search python heroku fabric osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/libexec:/usr/local/texlive/2010/bin/x86_64-darwin/
export NODE_PATH=/usr/local/lib/node_modules
# any options that are set in a function are unchanged after function scope ends
setopt localoptions localtraps

