FROM ruby:2.3.3
# For rails
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs 
RUN mkdir /hesrecipes
WORKDIR /hesrecipes
ADD Gemfile /hesrecipes/Gemfile
ADD Gemfile.lock /hesrecipes/Gemfile.lock
RUN bundle install
ADD . /hesrecipes
