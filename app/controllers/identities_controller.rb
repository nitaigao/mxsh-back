class IdentitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @identities = Identity.where(user_id: current_user_id).order(created_at: :desc)
    fresh_when @identities
    expires_in 1.minute
  end

  def create
    hash = SecureRandom.hex(3)
    email = "#{hash}@mxsh.io"
    @identity = current_user.identities.create!(email: email)
  end
end
