
FROM amazonlinux

MAINTAINER griffinish@gmail.com

WORKDIR /root

#ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color


#RUN yum clean
RUN yum -q -y update 

RUN amazon-linux-extras install -y epel

RUN yum install -q -y gcc-c++ make git 

RUN yum install -q -y gdb

RUN yum install -q -y clang-devel clang-tools-extra

RUN yum install -q -y emacs-nox 

RUN yum install -q -y locate man

RUN yum install -q -y python3 python3-devel python3-pip

RUN yum install -q -y wget 

RUN yum install -q -y sudo

RUN yum install -q -y mlocate

RUN yum install -q -y openldap-devel

RUN yum install -q -y man-pages

RUN yum install -q -y yum-utils

RUN yum install -q -y bind-utils

RUN yum install -q -y telnet

RUN yum install -q -y tar

RUN yum install -q -y patchelf

RUN yum install -q -y time

RUN yum install -q -y file

RUN yum install -q -y glibc-static

RUN amazon-linux-extras install golang1.11

RUN rm -f /etc/skel/.emacs

RUN echo 'griffin ALL=(root)NOPASSWD: ALL' > /etc/sudoers.d/griffin

COPY init.el /etc/skel/.emacs.d/init.el

RUN sed -i -e "s/;34m/;37m/" /etc/skel/.bashrc

RUN echo "export PATH=~/.cargo/bin:~/go/bin:$PATH" >> /etc/skel/.bashrc

COPY ps1.sh /tmp

RUN sh /tmp/ps1.sh

COPY sshd_config.to_append.txt /tmp

RUN cat /etc/ssh/ssh_config /tmp/sshd_config.to_append.txt > /tmp/ssh_config && cp /tmp/ssh_config /etc/ssh

RUN yes | adduser griffin > /dev/null 2>&1

RUN su - griffin -c "emacs --script ~griffin/.emacs.d/init.el"

RUN updatedb

USER griffin

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /tmp/rustup.sh

RUN sh /tmp/rustup.sh -y

RUN ~/.cargo/bin/rustup component add rls rust-analysis rust-src

RUN pip3 install --user awscli

RUN pip3 install --user ipython

RUN pip3 install --user nuitka

RUN mkdir /tmp/turd

WORKDIR /tmp/turd

RUN go mod init turd

RUN go get golang.org/x/tools/gopls@latest

RUN rm -rf /tmp/turd

RUN sudo ln -s ~/go/bin/gopls /usr/local/bin

#RUN pip3 install python-language-server

WORKDIR /WORK

CMD [ "/bin/bash", "-l", "--" ]

