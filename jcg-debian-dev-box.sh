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

apt-get ${APTOPT} autoremove

curl -s 'https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz' | tar -C /usr/local -xzf -

updatedb


echo '
export PATH=$PATH:/usr/local/go/bin
' >> /etc/profile.d/path.s
