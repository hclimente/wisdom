export PS1="\[\033[38;5;214m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;14m\]\W\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;1m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# color grep output
alias grep="grep --color"

# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# shorten frequent commands
alias h='history'
alias labnotebook='jupyter notebook --notebook-dir="~/smartas/notebook"'
alias ll='ls -oath'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

alias jar='java -jar'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# useful git aliases
alias ga='git add'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gd='git diff'
alias gco='git checkout'
alias gp='git push'
alias gst='git status'
alias gl='git pull'
