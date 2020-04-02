# docker-meetbot

This is a Dockerfile repository for [MeetBot](https://github.com/dwt2/meetbot), an IRC meeting bot that runs on Limnoria.

## Build

Copy your working Limnoria config file to config.conf and build the container

## Run

You will want to map a local directory to /data, as this isn't much use if you don't write the meeting logs to disk, e.g.

```shell
docker run -v /foo/meetbot:/data --rm -it limnoria
```
