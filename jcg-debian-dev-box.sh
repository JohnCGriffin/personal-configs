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
	cmake \
	emacs25-nox \
	git \
	htop \
	less \
	locate \
	man \
	python3 python3-pip ipython3 \
	ssh \
	tmux \
	vim \
	wget curl


updatedb

curl -s 'https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz' | tar -C /usr/local -xzf -

THEMES=`locate wheatgrass-theme.el | sort | grep emacs/25 | tail -1 | sed -e 's/wheatgrass-theme.el//'`
curl -s 'https://raw.githubusercontent.com/JohnCGriffin/personal-configs/master/donkey-theme.el' > ${THEMES}donkey-theme.el


mkdir -p /etc/skel/.vim/colors/
curl -s 'https://raw.githubusercontent.com/JohnCGriffin/personal-configs/master/moody.vim' > /etc/skel/.vim/colors/moody.vim
curl -s 'https://raw.githubusercontent.com/JohnCGriffin/personal-configs/master/dot-emacs.el' > /etc/skel/.emacs
curl -s 'https://raw.githubusercontent.com/JohnCGriffin/personal-configs/master/dot-vimrc' > /etc/skel/.vimrc

# change PS1
sed -i -e 's/;34m/;37m/' /etc/skel/.bashrc

echo '
export PATH=$PATH:/usr/local/go/bin
' >> /etc/profile.d/path.sh

updatedb
