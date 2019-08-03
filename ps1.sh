
cat << __EOS__ >> /etc/skel/.profile
#export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1="\[\e[32m\]\u@\h\[\e[m\]:\[\e[33m\]\w\[\e[m\]\\$ "
export EDITOR=emacs
__EOS__
