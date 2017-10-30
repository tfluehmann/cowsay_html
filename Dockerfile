FROM ruby

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY .  $APP_HOME/

RUN gem install bundler
RUN bundle install
ENV PORT 8080 
EXPOSE 8080
CMD rackup -P /tmp/rack.pid --host 0.0.0.0 --port $PORT
