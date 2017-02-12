class BounceJob < ApplicationJob
  queue_as :bounces

  NOTIFIER = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL']

  def perform(payload)
    message = JSON.parse(payload["Message"])
    recipients = message['bounce']['bouncedRecipients']
    recipients.each do |recipient|
      disable recipient['emailAddress'].gsub('<', '').gsub('>', '')
    end
  end

  def disable(email)
    user = User.find_by!(email: email)
    user.update(enabled: false)
    notify_slack(user) if Rails.env.production?
  end

  def notify_slack(user)
    message = <<-EOS
    #{user.email} has been disabled
    EOS
    NOTIFIER.ping message, channel: "#support", username: "Bounce", icon_emoji: ":warning:"
  end
end

