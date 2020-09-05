
FROM ubuntu:20.04

MAINTAINER griffinish@gmail.com

WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color

RUN echo 2020-09-05

RUN apt-get clean
RUN apt-get update 
RUN apt-get upgrade -y 
RUN apt-get install --no-install-recommends -y apt-utils 2> /dev/null
RUN apt-get install --no-install-recommends -y nodejs npm sudo apt-utils 

RUN apt-get install --no-install-recommends -y build-essential
RUN apt-get install --no-install-recommends -y cmake
RUN apt-get install --no-install-recommends -y git
RUN apt-get install --no-install-recommends -y rustc
RUN apt-get install --no-install-recommends -y emacs-nox
RUN apt-get install --no-install-recommends -y vim
RUN apt-get install --no-install-recommends -y less
RUN apt-get install --no-install-recommends -y locate
RUN apt-get install --no-install-recommends -y man
RUN apt-get install --no-install-recommends -y python3-nox
RUN apt-get install --no-install-recommends -y python3-pip
RUN apt-get install --no-install-recommends -y wget
RUN apt-get install --no-install-recommends -y curl
RUN apt-get install --no-install-recommends -y clang
RUN apt-get install --no-install-recommends -y awscli
RUN apt-get install --no-install-recommends -y ssh-client


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

RUN pip3 install --user --no-warn-script-location ipython
RUN pip3 install --user boto3

WORKDIR /WORK

CMD [ "/bin/bash", "-l" ]
