#!/bin/bash

/usr/bin/madsonic --home=/config --default-music-folder=/media --https-port=4050

tail -F /config/madsonic_sh.log
