ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ActiveSupport::TestCase
  fixtures :all

  include ActiveJob::TestHelper
end

def auth_as(user)
  auth_user = users(user)
  login = LoginToken.find_by(email: auth_user.email)
  post '/api/authorize', params: { token: login.token }
end

require 'mocha/setup'
