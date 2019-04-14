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
	emacs-nox \
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


pip3 install setuptools && pip3 install ipython mypy XlsxWriter

curl -s 'https://dl.google.com/go/go1.12.4.linux-amd64.tar.gz' | tar -C /usr/local -xzf -

THEMES=`locate wheatgrass-theme.el | sort | grep emacs/2 | tail -1 | sed -e 's/wheatgrass-theme.el//'`
curl -s 'https://raw.githubusercontent.com/JohnCGriffin/personal-configs/master/donkey-theme.el' > ${THEMES}donkey-theme.el


mkdir -p /etc/skel/.vim/colors/
curl -s 'https://raw.githubusercontent.com/JohnCGriffin/personal-configs/master/moody.vim' > /etc/skel/.vim/colors/moody.vim

curl -s 'https://raw.githubusercontent.com/JohnCGriffin/personal-configs/master/dot-vimrc' > /etc/skel/.vimrc

git clone https://github.com/JohnCGriffin/dot-emacs-dot-d.git /etc/skel/.emacs.d

# change PS1
sed -i -e 's/;34m/;37m/' /etc/skel/.bashrc

echo '
export PATH=$PATH:/usr/local/go/bin
' >> /etc/profile.d/path.sh

cat << __EOS__ >> /etc/skel/.profile
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export EDITOR=emacs
export PATH=$PATH:/usr/local/go/bin
__EOS__


updatedb
