FROM ubuntu

MAINTAINER griffinish@gmail.com

WORKDIR /root

RUN apt-get -qq update && apt-get -y -qq install wget
RUN wget -q 'https://raw.githubusercontent.com/JohnCGriffin/personal-configs/master/jcg-debian-dev-box.sh'
RUN sh jcg-debian-dev-box.sh

CMD [ "/bin/bash" ]
