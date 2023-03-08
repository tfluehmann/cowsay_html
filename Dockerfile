FROM ruby:3.2.1-alpine3.17

ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler ruby-json

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME/

RUN gem install bundler
RUN bundle install
ENV PORT 8080
EXPOSE 8080
CMD rackup -P /tmp/rack.pid --host 0.0.0.0 --port $PORT
