FROM alpine:3.5

MAINTAINER Lutz Selke <ls@hfci.de>

WORKDIR /rails

ENV APP_PACKAGES="curl-dev build-base git openssh zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev mysql-dev mysql-client nodejs imagemagick-dev supervisor sphinx" \
    RUBY_PACKAGES="ruby-dev ruby ruby-io-console ruby-rdoc ruby-bundler ruby-bigdecimal ruby-irb ruby-json ruby-libs ruby-rake" \
    NPM_PACKAGES="bower yarn" \
    GEM_PACKAGES="puma" \
    RAILS_SERVE_STATIC_FILES=1 \
    RAILS_ROOT=/rails \
    GIT_DIR=/rails \
    SECRET_KEY_BASE="please-overwrite-this-in-your-docker-env"

RUN apk add --update --upgrade $APP_PACKAGES
RUN apk add $RUBY_PACKAGES
RUN npm install -g $NPM_PACKAGES
RUN gem install $GEM_PACKAGES

ADD conf/bowerrc /root/.bowerrc
ADD conf/supervisord.conf /etc/supervisord.conf
ADD support/* /support/

EXPOSE 80

ENTRYPOINT ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
