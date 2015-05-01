# Androguard-plugin

Docker image for androguard

# USAGE

This will use the pre-built image on the public registry (see [this](https://registry.hub.docker.com/u/barbudo/androguard/))

```shell
$ docker pull barbudo/androguard
$ docker run -t -i barbudo/androguard /bin/bash
root@1fe111e78fc6:/# /opt/androlyze.sh -s
```

Similarly this will start the `androlyze` shell by default (the `-v` option is
to mount a folder from the host to the guest):

```shell
$ docker run -t -i -v /path/to/apks:/data barbudo/androguard
Androlyze version 2.0
In [1]: apk = APK('/data/test.apk')

In [2]: apk.get_activities()
Out[2]: ['com.example.gangrene.GangreneActivity']
```


## BUILD

```shell
$ docker build -t androguard .
```

## Thanks:

The androguard developers https://github.com/androguard/androguard

This docker image is based on a code from https://github.com/dweinstein/dockerfile-androguard