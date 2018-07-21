FROM ubuntu:16.04
LABEL maintainer="Yuya Matsushima"

ENV APP_DIR /app
ENV HUGO_ENV development
ENV HUGO_VERSION 0.44

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp

RUN tar xvzf /tmp/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -C /tmp \
      && mkdir -p /usr/local/bin \
      && mv /tmp/hugo /usr/local/bin/hugo

RUN apt-get -qq update \
      && apt-get install -y git make language-pack-ja python-pygments \
      && rm -rf /var/lib/apt/lists/*

WORKDIR $APP_DIR

EXPOSE 1313

VOLUME $APP_DIR

CMD ["hugo", "-v"]
