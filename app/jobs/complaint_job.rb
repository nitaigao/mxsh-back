class ComplaintJob < ApplicationJob
  queue_as :complaints

  def perform(email)
    user = User.find_by!(email: email)
    user.update!(enabled: false)
    notify_slack(user) if Rails.env.production?
  end

  def notify_slack(user)
    message = <<-EOS
    #{user.email} has been disabled due to a compaint
    EOS
    
    Slack::Notifier.new(ENV['SLACK_WEBHOOK_URL']).ping message, channel: "#support", username: "Bounce", icon_emoji: ":warning:"
  end
end

