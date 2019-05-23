FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /finance-app

WORKDIR /finance-app

ADD Gemfile /finance-app/Gemfile

ADD Gemfile.lock /finance-app/Gemfile.lock

RUN gem install bundler --version=1.15.2

RUN bundle install

ADD . /finance-app
