require 'test_helper'

class BounceJobTest < ActiveJob::TestCase
  test "should disable the account in the bounce" do
    file_path = File.join(File.dirname(__FILE__), *%w[.. fixtures files bounce.json])
    payload = JSON.parse(File.read(file_path))
    BounceJob.new.perform(payload)
    user = users(:user)
    refute user.enabled
  end
end
