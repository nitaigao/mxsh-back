FROM ruby:2.4.0-alpine

WORKDIR /app

RUN apk add --no-cache git postgresql-dev make gcc g++ python bash curl

COPY .ruby-version /app/.ruby-version

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install --without development:test

RUN apk del make gcc g++ python
RUN rm -rf /var/cache/apk/*

COPY . /app

EXPOSE 4000

ENTRYPOINT bundle exec puma -C config/puma.rb