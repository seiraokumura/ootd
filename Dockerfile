FROM ruby:2.6.1

ENV RUBYOPT -EUTF-8

RUN bundle config --global frozen 1
RUN apt-get update -qq \
 && apt-get install -y nodejs vim

WORKDIR /var/www/app

# COPY Gemfile Gemfile.lock ./
# RUN bundle install

