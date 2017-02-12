require 'test_helper'

class ForwardEmailJobTest < ActiveJob::TestCase
  test "should not forward any email for a non match" do
    file_path = File.join(File.dirname(__FILE__), *%w[.. fixtures files unknown.json])
    payload = JSON.parse(File.read(file_path))
    ForwardEmailJob.any_instance.expects(:forward_email).never
    ForwardEmailJob.new.perform(payload['mailinMsg'])
  end

  test "should forward any email for a match" do
    file_path = File.join(File.dirname(__FILE__), *%w[.. fixtures files known.json])
    payload = JSON.parse(File.read(file_path))
    ForwardEmailJob.any_instance.expects(:forward_email)
    ForwardEmailJob.new.perform(payload['mailinMsg'])
  end

  test "should not forward any email for a user that is not enabled" do
    file_path = File.join(File.dirname(__FILE__), *%w[.. fixtures files disabled.json])
    payload = JSON.parse(File.read(file_path))
    ForwardEmailJob.any_instance.expects(:forward_email).never
    ForwardEmailJob.new.perform(payload['mailinMsg'])
  end
end
