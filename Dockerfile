
FROM amazonlinux

MAINTAINER griffinish@gmail.com

WORKDIR /root

#ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color


#RUN yum clean
RUN yum -q -y update 

RUN amazon-linux-extras install -y epel 
RUN amazon-linux-extras install -y rust1

RUN yum install -q -y gcc-c++ make git

RUN yum install -q -y emacs-nox 

RUN yum install -q -y locate man

RUN yum install -q -y python3 python3-pip

RUN yum install -q -y wget 

RUN yum install -q -y sudo

RUN yum install -q -y mlocate

RUN yum install -q -y openldap-devel

RUN yum install -q -y man-pages

RUN yum install -q -y yum-utils

RUN yum install -q -y bind-utils

RUN yum install -q -y telnet

RUN yum install -q -y tar

RUN rm -f /etc/skel/.emacs

RUN echo 'griffin ALL=(root)NOPASSWD: ALL' > /etc/sudoers.d/griffin

RUN pip3 install ipython

RUN pip3 install awscli

RUN git clone https://github.com/JohnCGriffin/dot-emacs-dot-d.git /etc/skel/.emacs.d

RUN sed -i -e "s/;34m/;37m/" /etc/skel/.bashrc

RUN echo "export PATH=~/.cargo/bin:$PATH" >> /etc/skel/.bashrc

COPY ps1.sh /tmp

RUN sh /tmp/ps1.sh

COPY sshd_config.to_append.txt /tmp

RUN cat /etc/ssh/ssh_config /tmp/sshd_config.to_append.txt > /tmp/ssh_config && cp /tmp/ssh_config /etc/ssh

RUN yes | adduser griffin > /dev/null 2>&1

RUN updatedb

USER griffin

WORKDIR /WORK

CMD [ "/bin/bash", "-l" ]
