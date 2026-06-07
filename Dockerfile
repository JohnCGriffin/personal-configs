

FROM debian:latest

WORKDIR /root

ENV TERM=linux

RUN apt -y update
RUN apt -y install sudo
RUN apt install -y racket 
RUN apt install -y g++ 
RUN apt install -y gdb 
RUN apt install -y emacs-nox
RUN apt install -y clangd
RUN apt install -y cmake
RUN apt install -y neovim
RUN apt install -y time
RUN apt install -y ssh
RUN apt install -y git
RUN apt install -y build-essential
RUN apt install -y curl
RUN apt install -y wget
RUN apt install -y tmux
RUN apt install -y python3
RUN apt install -y man
RUN apt install -y less
RUN apt install -y golang
RUN apt install -y gopls
RUN apt install -y libvterm-dev
RUN apt install -y python3-pip 
RUN apt install -y python3-venv 
RUN apt install -y man-db
RUN apt install -y groff
RUN apt install -y locate
RUN apt install -y libncurses-dev


RUN apt-get update && apt-get install -y locales \
 && sed -i 's/^# *en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
 && locale-gen

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN echo 'griffin ALL=(root)NOPASSWD: ALL' > /etc/sudoers.d/griffin

RUN yes | adduser griffin > /dev/null 2>&1

COPY setup-emacs.el /home/griffin/setup-emacs.el

RUN mkdir -p /home/griffin/.emacs.d
RUN mkdir -p /home/griffin/.config/clangd
RUN mkdir -p /home/griffin/bin

COPY config.yaml /home/griffin/.config/clangd/

RUN echo export LANG=en_US.UTF-8 >> /home/griffin/.bashrc
RUN echo export PATH=~/bin:$PATH >> /home/griffin/.bashrc

COPY init.el /home/griffin/.emacs.d/
COPY tm-shell-script /home/griffin/bin/tm
RUN chmod a+x /home/griffin/bin/tm

RUN chown -R griffin /home/griffin

RUN updatedb

USER griffin
ENV HOME=/home/griffin


RUN raco pkg install --auto racket-langserver

RUN emacs --batch -l /home/griffin/setup-emacs.el 


WORKDIR /WORK

CMD [ "/bin/bash" ]
