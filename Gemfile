source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'

gem 'shoryuken', :git => 'https://github.com/phstc/shoryuken.git', :branch => 'thread-pool'
gem 'aws-sdk-rails'
gem 'email_validator', '~> 1.5.0'

gem 'jwt'
gem 'jbuilder'
gem 'sentry-raven'
gem 'tzinfo-data'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sinatra', github: 'sinatra/sinatra', branch: 'master'
  gem 'fake_sqs'
  gem 'foreman'
end

group :test do
  gem 'minitest-reporters'
  gem 'mocha'
  gem 'guard'
  gem 'guard-minitest'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
