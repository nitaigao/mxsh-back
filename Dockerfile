FROM ruby:2.4.0-alpine

EXPOSE 4000

ENTRYPOINT bundle exec puma -C config/puma.rb