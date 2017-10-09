FROM ubuntu:16.04

# Install Apt Packages
RUN apt-get update && apt-get install -y \
    ca-certificates \
    locales \
    unzip \
    wget \
    default-jre

RUN locale-gen en_US en_US.UTF-8

# Madsonic Package Information
ENV PKG_NAME madsonic
ENV PKG_VER 6.2
ENV PKG_BUILD 9040
ENV PKG_DATE 20161208

ENV DEB_NAME ${PKG_DATE}_${PKG_NAME}-${PKG_VER}.${PKG_BUILD}.deb

RUN wget http://madsonic.org/download/${PKG_VER}/${DEB_NAME}
RUN dpkg -i ${DEB_NAME}

# Create hardlinks to the transcoding binaries.
# This way we can mount a volume over /var/madsonic.
# <host-dir>/var/madsonic/transcode/ffmpeg -> /usr/local/bin/ffmpeg
RUN ln /var/madsonic/transcode/ffmpeg /usr/local/bin

# Clean out the system to shrink the image
RUN apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log

VOLUME /var/madsonic
VOLUME /config
VOLUME /media

EXPOSE 4040
EXPOSE 4050

ADD ./start.sh /start.sh
RUN chmod +x  /start.sh

ENTRYPOINT ["/start.sh"]
