class ForwardEmailJob < ApplicationJob
  queue_as :outbound

  SES = Aws::SES::Client.new(region: 'us-east-1')

  def perform(message)
    recipient = message['to'].first['address']
    identity = Identity.find_by(email: recipient)
    if identity.present?
      puts "Matched #{recipient} => #{identity.user.email}"
      forward_email(identity.user, message)
    else
      puts "No match found for #{recipient}"
    end
  end

  def forward_email(user, message)
    SES.send_email({
      destination: {
        bcc_addresses: [],
        cc_addresses:  [],
        to_addresses: [
          "#{message['to'].first['name']} <#{user.email}>"
        ],
      }, 
      message: {
        body: {
          html: {
            charset: "UTF-8", 
            data: message['html']
          }, 
          text: {
            charset: "UTF-8", 
            data: message['text']
          }, 
        }, 
        subject: {
          charset: "UTF-8", 
          data: message['subject']
        },
      },
      reply_to_addresses: [ ],
      source: "#{message['from'].first['name']} <#{ENV['MAIL_FORWARD_FROM']}>"
    })
  end
end
