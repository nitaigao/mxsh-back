require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should not create more than one login token per user" do
    assert_difference 'LoginToken.count', 1 do
      post '/api/login', params: { login: { email: 'login@example.com' } }
      post '/api/login', params: { login: { email: 'login@example.com' } }
    end
  end

  test "should create a user if it doesnt already exist" do
    assert_difference 'User.count' do
      post '/api/authorize', params: { token: login_tokens(:signup).token }
    end
  end

  test "should delete the user token after use" do
    assert_difference 'LoginToken.count', -1 do
      post '/api/authorize', params: { token: login_tokens(:signup).token }
    end
  end
end
