FROM ruby:2.4

RUN apt-get update -qq && apt-get install -y build-essential nodejs vim

RUN mkdir /people
WORKDIR /people

ADD Gemfile /people/Gemfile
ADD Gemfile.lock /people/Gemfile.lock

RUN gem install bundler

RUN bundle install

ADD . /people
