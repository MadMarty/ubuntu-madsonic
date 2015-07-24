ubuntu madsonic
===============

Madsonic Beta (http://www.madsonic.org/)

### Run

docker run -d --net=host -e SSL="yes" -v ${madsonic_config_dir}:/config -v ${madsonic_data_dir}:/media -v /etc/localtime:/etc/localtime:ro -p 4040:4040 -p 4050:4050 --name=madsonic madsonic/ubuntu-madsonic



