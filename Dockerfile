FROM ruby:2.7.2

# OS Package
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# WorkSpace
RUN mkdir /conpath
ENV APP_ROOT /conpath
WORKDIR $APP_ROOT

# Push Gemfile
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# bundle install
RUN bundle install
ADD . $APP_ROOT