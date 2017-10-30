FROM ruby

ENV APP_HOME /app
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY .  $APP_HOME/

RUN gem install bundler
RUN bundle install
ENV PORT 3000
EXPOSE 3000
CMD ruby $APP_HOME/lib/start.rb
