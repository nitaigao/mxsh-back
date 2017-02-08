class SessionMailer < ApplicationMailer
  default from: 'hello@mxsh.io'
  
  HOST = Rails.env.development? ? 'http://mxsh.lvh.me:3000' : 'http://mxsh.io'

  def login(token)
    @url = "#{HOST}/authorize/#{token.token}"
    mail(to: token.email, subject: 'Login to MXSH')
  end
end
