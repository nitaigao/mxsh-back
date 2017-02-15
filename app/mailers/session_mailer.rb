class SessionMailer < ApplicationMailer
  default from: 'hello@mxsh.io'
  
  def login(token)
    @url = "#{ENV['FRONTEND_HOST']}/authorize/#{token.token}"
    mail(to: token.email, subject: 'Login to MXSH')
  end
end
