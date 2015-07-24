#! /bin/sh

/usr/bin/madsonic --home=/config --default-music-folder=/media

tail -F /var/madsonic/madsonic_sh.log
