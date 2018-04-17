FROM ubuntu:16.04
MAINTAINER Yuya Matsushima

ENV HUGO_VERSION 0.39

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp

RUN tar xvzf /tmp/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -C /tmp \
      && mkdir -p /usr/local/bin \
      && mv /tmp/hugo /usr/local/bin/hugo

RUN apt-get -qq update \
      && apt-get install -y curl language-pack-ja ca-certificates git \
      && apt-get install -y python-pygments \
      && apt-get install -y awscli

EXPOSE 1313
