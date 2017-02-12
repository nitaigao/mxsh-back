class AbuseController < ApplicationController
  def bounce
    User.find_by!(email: email_param).update!(enabled: false)
  end

  private

  def email_param
    params.require(:email)
  end
end
