class BounceJob < ApplicationJob
  queue_as :bounces

  def perform(email)
    User.find_by!(email: email).update!(enabled: false)
    notify_slack(user) if Rails.env.production?
  end

  def notify_slack(user)
    message = <<-EOS
    #{user.email} has been disabled
    EOS
    
    Slack::Notifier.new(ENV['SLACK_WEBHOOK_URL']).ping message, channel: "#support", username: "Bounce", icon_emoji: ":warning:"
  end
end

