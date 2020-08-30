
FROM ubuntu:20.04

MAINTAINER griffinish@gmail.com

WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color


RUN apt-get clean
RUN apt-get -qq update 
RUN apt-get upgrade -y 2> /dev/null < /dev/null
RUN apt-get -qq install --no-install-recommends -y apt-utils 2> /dev/null < /dev/null
RUN apt-get -qq install -y nodejs npm sudo apt-utils 2> /dev/null < /dev/null
RUN apt-get -qq -y install \
	build-essential cmake git \
	rustc \
	emacs-nox vim \
	less \
	locate \
	man \
	python3 python3-pip ipython3 \
	wget curl
RUN apt-get -qq -y install clang



RUN echo 'griffin ALL=(root)NOPASSWD: ALL' > /etc/sudoers.d/griffin

COPY init.el /etc/skel/.emacs.d/

RUN sed -i -e "s/;34m/;37m/" /etc/skel/.bashrc

RUN echo "export PATH=~/.cargo/bin:$PATH" >> /etc/skel/.bashrc

COPY ps1.sh /tmp

RUN sh /tmp/ps1.sh

COPY sshd_config.to_append.txt /tmp

RUN cat /etc/ssh/ssh_config /tmp/sshd_config.to_append.txt > /tmp/ssh_config && cp /tmp/ssh_config /etc/ssh

RUN yes | adduser griffin > /dev/null 2>&1

RUN su - griffin -c "emacs --script ~griffin/.emacs.d/init.el"

USER griffin

WORKDIR /WORK

CMD [ "/bin/bash", "-l" ]
