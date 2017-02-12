class AbuseController < ApplicationController
  def bounce
    User.find_by!(email: email_param).update!(enabled: false)
    render text: 'ok!'
  end

  private

  def email_param
    params.require(:email)
  end
end
