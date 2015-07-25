Madsonic Ubuntu docker image 
============================

Madsonic http://www.madsonic.org

Latest Beta Release of Madsonic.

**Pull image**

```
docker pull madsonic/ubuntu-madsonic
```

**Run container**

```
docker run -d -p 4040:4040 -p 4050:4050 --name=<container name> -net=host -e SSL="no" -v <path for media files>:/media -v <path for config files>:/config -v /etc/localtime:/etc/localtime:ro madsonic/ubuntu-madsonic
```

Please replace all user variables in the above command defined by <> with the correct values.


**Access application**

```
http://<host ip>:4040
```

or if you have enabled SSL

```
https://<host ip>:4050
```





