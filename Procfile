web: bundle exec rails s
queue: bundle exec fake_sqs
worker: bundle exec rake queue:create && bundle exec shoryuken -R -C config/shoryuken.yml