
cat << __EOS__ >> /etc/skel/.bash_profile
export PS1="\[\e[32m\]\u@AZ_Dockerized\[\e[m\]:\[\e[33m\]\w\[\e[m\]\\$ "
export EDITOR=emacs
__EOS__
