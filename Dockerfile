FROM ubuntu:14.10

RUN locale-gen en_US en_US.UTF-8

RUN apt-get update
RUN apt-get -qqy --force-yes dist-upgrade
RUN apt-get install -qqy --force-yes wget default-jre-headless

RUN wget http://madsonic.org/download/6.0/20150724_madsonic-6.0.6870.deb
RUN dpkg -i 20150724_madsonic-6.0.6870.deb

VOLUME /config
VOLUME /media

EXPOSE 4040
EXPOSE 4050

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

ENTRYPOINT ["/start.sh"]

