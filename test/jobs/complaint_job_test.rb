require 'test_helper'

class ComplaintJobTest < ActiveJob::TestCase
  test "should disable the account in the bounce" do
    user = users(:user)
    assert user.enabled
    BounceJob.new.perform(user.email)
    refute User.find(user.id).enabled
  end
end
