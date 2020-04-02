FROM python:3.8-alpine

LABEL maintainer DW Talton <dwtalton@contractor.linuxfoundation.org>
LABEL description Docker image for MeetBot (Limnoria IRC bot)

ENV MEETBOT_VERSION master

RUN apk add --update git && \
    pip3 install -r https://raw.githubusercontent.com/dwt2/meetbot/${MEETBOT_VERSION}/requirements.txt && \
    pip3 install git+https://github.com/dwt2/meetbot.git@${MEETBOT_VERSION} && \
    apk del git && \
    rm -rf /var/cache/apk/*

RUN adduser -S limnoria && \
    mkdir /data && \
    mkdir /config && \
    chown -R limnoria /data

COPY ["config.conf", "/config"]
RUN chown -R limnoria /config

USER limnoria

VOLUME ["/data"]
WORKDIR /data

CMD exec supybot /config/config.conf

# ONBUILD ARG CONFIG_FOLDER=config
# ONBUILD ADD [CONFIG_FOLDER] .
