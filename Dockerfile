FROM ubuntu

MAINTAINER griffinish@gmail.com

WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=linux


RUN apt-get clean
RUN apt-get -qq update 
RUN apt-get upgrade -y 2> /dev/null < /dev/null
RUN apt-get -qq install --no-install-recommends -y apt-utils 2> /dev/null < /dev/null


RUN apt-get -qq install -y wget

RUN wget -q 'https://raw.githubusercontent.com/JohnCGriffin/personal-configs/master/jcg-debian-dev-box.sh'

RUN sh jcg-debian-dev-box.sh

CMD [ "/bin/bash" ]
