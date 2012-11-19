# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mrtazz"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(compleat history-substring-search)

source $ZSH/oh-my-zsh.sh

# fuck oh-my-zsh git module is so fucking slow
function git_prompt_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Customize to your needs...
source /usr/local/bin/virtualenvwrapper.sh
export PATH=/Users/leahxue/local/Android/android-ndk-r8:/Users/leahxue/local/Android/android-sdk-macosx/platform-tools:/Users/leahxue/local/Android/android-sdk-macosx/tools:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# facebook stuff
export PATH="/Users/leahxue/devEnv/buck/bin:$PATH"
export PATH="/Users/leahxue/devEnv/arcanist/bin:$PATH"
export ANDROID_SDK="/Users/leahxue/local/Android/android-sdk-macosx"
export ANDROID_HOME="/Users/leahxue/local/Android/android-sdk-macosx"
alias bb="buck build //:fbandroid_debugshrink"
alias bi="buck install //:fbandroid_debugshrink"
export DEVSERVER="dev146.prn1.facebook.com"

# facebook android
export NDK_MODULE_PATH='/Users/leahxue/local/Android/android-ndk-r8'
export PATH="$NDK_MODULE_PATH:$PATH"
export ANDROID_HOME='/Users/leahxue/local/Android/android-sdk-macosx'
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# Cabal
export PATH="/Users/leahxue/Library/Haskell/bin:$PATH"

#~/bin
export PATH="/Users/leahxue/bin:$PATH"
export PATH="/Users/leahxue/proj_gen:$PATH"

alias szz="source ~/.zshrc"
alias sze="source ~/.zshenv"
alias zrc="vim ~/.zshrc"

