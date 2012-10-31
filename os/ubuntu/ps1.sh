# since I don't run ubuntu locally,
# I *do* want to see username/host
export PS1='${debian_chroot:+($debian_chroot)}\033[01;32m\]\u@\h\[\033[00m\] \e[1;33m\w\e[m$(type __git_ps1 &>/dev/null && __git_ps1 "$DK_GREEN<%s>$NORMAL_COLOR") \e[1;36m::\e[m '

