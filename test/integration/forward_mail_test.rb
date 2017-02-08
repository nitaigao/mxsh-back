require 'test_helper'

class ForwardMailTest < ActionDispatch::IntegrationTest
  test "sends the email to a test address" do
    file_path = File.join(File.dirname(__FILE__), *%w[.. fixtures files unknown.json])
    payload = JSON.parse(File.read(file_path))
    ForwardEmailJob.perform_now(payload['mailinMsg'])
  end
end
