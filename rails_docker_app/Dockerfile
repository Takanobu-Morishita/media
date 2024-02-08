FROM ruby:3.2.2

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem update --system 3.3.20 && \
    bundle install

COPY . /app