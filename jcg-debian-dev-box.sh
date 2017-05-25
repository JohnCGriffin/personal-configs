#!/bin/sh

########################################################
# This is my general Debian/Ubuntu setup for Unix
# command line development in C/C++/Go/Python.  
# It can be run from VPS, LXC container or from Docker.  
########################################################

APTOPT="-qq -y --no-install-recommends"

apt-get ${APTOPT} update 

apt-get ${APTOPT} install apt-utils 2> /dev/null

echo debconf debconf/frontend select Noninteractive | debconf-set-selections

apt-get ${APTOPT} install \
    build-essential \
    emacs24-nox \
    git \
    less \
    locate \
    man \
    python3 python3-pip ipython3 \
    ssh \
    tmux \
    vim \
    wget curl \


curl -s 'https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz' | tar -C /usr/local -xzf -

cat <<__EOF__  >> /etc/skel/.emacs

; General
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(setq make-backup-files nil)
(menu-bar-mode -1)

(setq-default tab-width 4)

(set-face-foreground 'font-lock-comment-face "color-240")

(custom-set-faces
 '(flymake-errline ((((class color)) (:foreground "White" :background "Red"))))
 '(flymake-warnline ((((class color)) (:underline "Yellow")))))

(load-theme 'wheatgrass)


; Python
(setq python-shell-interpreter "python3")

; Racket
(add-to-list 'auto-mode-alist '("\\.rkt" . scheme-mode))


__EOF__


# Pythonic .vimrc
cat <<__EOF__ >> /etc/skel/.vimrc

syntax on
set background=dark
let loaded_matchparen = 1
:set ts=8 et sw=4 sts=4
set foldmethod=indent
set foldlevel=99


__EOF__


echo '
export PATH=$PATH:/usr/local/go/bin
' >> /etc/profile.d/path.sh


updatedb




