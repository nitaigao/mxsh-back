class ApplicationController < ActionController::Base
  include ::ActionController::Cookies

  protected

  def bearer_token
    pattern = /^Bearer /
    header  = request.headers["Authorization"] # <= env
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def auth_token
    cookies[:auth] || bearer_token
  end

  def current_user
    decoded = JWT.decode(auth_token, nil, false)
    user_id = decoded.first['id']
    @user ||= User.find(user_id)
  end

  def sign_in(user)
    token = JWT.encode({id: user.id}, nil, 'none')
    cookies[:auth] = {
      value: token,
      expires: 1.year.from_now
    }
    token
  end

  def authenticate_user!
    current_user
  rescue
    head(:unauthorized)
  end
end
