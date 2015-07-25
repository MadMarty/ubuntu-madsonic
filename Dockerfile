FROM ubuntu:14.10

RUN locale-gen en_US en_US.UTF-8

# update Apt Packages
RUN apt-get update
RUN apt-get -qqy --force-yes dist-upgrade

# Add Oracle Java Repo
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/webupd8team-java.list \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
  && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# Install Apt Packages
RUN apt-get update && apt-get install -y \
  ca-certificates \
  locales \
  oracle-java8-installer \
  oracle-java8-set-default \
  unzip \
  wget

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
