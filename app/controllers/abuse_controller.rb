class AbuseController < ApplicationController
  def bounces
    BounceJob.perform_later(email_param)
    render text: 'ok!'
  end

  def complaints
    ComplaintJob.perform_later(email_param)
    render text: 'ok!'
  end

  private

  def email_param
    params.require(:email)
  end
end
