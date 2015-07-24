#! /bin/sh

/usr/bin/madsonic --home=/config --default-music-folder=/media

tail -F /config/madsonic_sh.log
