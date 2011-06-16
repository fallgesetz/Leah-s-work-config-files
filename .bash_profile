export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
####
## PATH MODIFICATIONS
#####

#macports
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

#other
export PATH="~/bin:$PATH"

#pypi installed stuff
export PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:$PATH"

############
#ADKU Stuff
############
export ADKU_HOME="/code/git/Adku" 
export EMR_EMAIL_USER="leah@adku.com"
alias fab="fab-2.6"
_fab_completion() {
    COMPREPLY=()

    # Fab in the path?
    /usr/bin/which -s fab-2.6 || return 0

    # Fabfile in this folder?
    [[ -e fabfile.py ]] || return 0

    local cur="${COMP_WORDS[COMP_CWORD]}"

    tasks=$(fab --shortlist)
    COMPREPLY=( $(compgen -W "${tasks}" -- ${cur}) )
}

if [ "x$ADKU_HOME" != "x" ]
  then
    export PATH=$ADKU_HOME/dev/scripts:$ADKU_HOME/third_party_dev/bashpath:$PATH
    export PYTHONPATH=$ADKU_HOME/third_party_dev/pythonpath:$ADKU_HOME/third_party/pythonpath:$ADKU_HOME/src:$PYTHONPATH

    export EC2_HOME=$ADKU_HOME/third_party_dev/ec2-api-tools-1.3-62308
    export EC2_AMITOOL_HOME=$ADKU_HOME/third_party_dev/ec2-ami-tools-1.3-57676
    export EC2_PRIVATE_KEY=$ADKU_HOME/tools/pk-SV5TARKT5OPEJGTZMGBMZD6RCTBLQONH.pem
    export EC2_CERT=$ADKU_HOME/tools/cert-SV5TARKT5OPEJGTZMGBMZD6RCTBLQONH.pem

    export PIG_HOME=$ADKU_HOME/third_party_dev/pig-0.8.0
    export HADOOP_HOME=$ADKU_HOME/third_party_dev/hadoop-0.20.2
fi

# keeps on killing my vimrc.
#. ~/Dropbox/My\ Machine\ Config/rc/bashrc
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

##########
# Bash completion
##########
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
    source ~/config/.git-completion.bash
    complete -F __fab_completion fab
fi


#############
#bash prompt
#############
PS1="\w\$(__git_ps1)\$ "

