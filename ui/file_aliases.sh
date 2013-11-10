#!/bin/sh

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
#alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias lal='ls -al'                            # the one I use all day long

alias l='ls -CF'                              #
alias lS='ls -FalS --color=tty'               # list by size (descending)

#general
export PATH="~/bin:$PATH"

alias wemux="TERM=screen-256color-bce wemux"
