require 'test_helper'

class AbuseControllerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  test "should disable a user on bounce" do
    user = users(:user)
    assert_enqueued_with job: BounceJob, args: [user.email] do
      post bounce_path, params: { email: user.email }
    end
  end
end
