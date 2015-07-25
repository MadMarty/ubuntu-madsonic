FROM ubuntu:14.10

RUN locale-gen en_US en_US.UTF-8

RUN apt-get update
RUN apt-get -qqy --force-yes dist-upgrade
RUN apt-get install -qqy --force-yes wget default-jre-headless

RUN wget http://madsonic.org/download/6.0/20150725_madsonic-6.0.6880.deb
RUN dpkg -i 20150725_madsonic-6.0.6880.deb

# Create hardlinks to the transcoding binaries.
# This way we can mount a volume over /var/madsonic.
# <host-dir>/var/madsonic/transcode/ffmpeg -> /usr/local/bin/ffmpeg
# <host-dir>/var/madsonic/transcode/lame -> /usr/local/bin/lame
RUN ln /var/madsonic/transcode/ffmpeg /var/madsonic/transcode/lame /usr/local/bin

VOLUME /var/madsonic
VOLUME /config
VOLUME /media

EXPOSE 4040
EXPOSE 4050

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

ENTRYPOINT ["/start.sh"]
