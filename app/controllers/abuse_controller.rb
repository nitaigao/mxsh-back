class AbuseController < ApplicationController
  def bounces
    BounceJob.perform_later(email_param)
    render plain: 'ok!'
  end

  def complaints
    ComplaintJob.perform_later(email_param)
    render plain: 'ok!'
  end

  private

  def email_param
    params.require(:email)
  end
end
