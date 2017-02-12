require 'test_helper'

class AbuseControllerTest < ActionDispatch::IntegrationTest
  test "should disable a user on bounce" do
    user = users(:user)
    assert user.enabled
    post bounce_path, params: { email: user.email }
    refute User.find_by(email: user.email).enabled
  end
end
