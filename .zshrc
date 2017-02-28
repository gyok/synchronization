# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000
if [[ $EUID == 0 ]] 
then
PROMPT=$'%{\e[1;31m%}%n %{\e[1;34m%}%~ #%{\e[0m%} 
>' # user dir %
else
PROMPT=$'%{\e[1;32m%}%n %{\e[1;34m%}%~ %#%{\e[0m%} 
>' # root dir #
fi
RPROMPT=$'%{\e[1;34m%}%T%{\e[0m%}' # right prompt with time

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gyok/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#Aliases
alias grep='grep --color=auto'
alias less='less --color=auto'
alias ls='ls --color=auto'
# alias skype='apulse32 skype'
alias steam='STEAM_RUNTIME=0 steam'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG

export PATH=/home/gyok/.gem/ruby/2.3.0/bin:/opt/cocos2d-x/tools/cocos2d-console/bin:/opt/cocos2d-x/tools/cocos2d-console/plugins/plugin_package:${PATH}
