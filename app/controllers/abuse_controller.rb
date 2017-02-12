class AbuseController < ApplicationController
  def bounce
    BounceJob.perform_later(email_param)
    render text: 'ok!'
  end

  private

  def email_param
    params.require(:email)
  end
end
