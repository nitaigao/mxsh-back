class SessionsController < ApplicationController
  def login
    login = LoginToken.find_or_create_by!(email: login_params[:email]) do |login|
      login.token = LoginToken.new_token
    end
    SessionMailer.login(login).deliver
    render json: { message: 'ok' }
  end

  def authorize
    login = LoginToken.find_by!(token: authorize_params).destroy!
    @user = User.find_or_create_by(email: login.email)
    @token = JWT.encode({id: @user.id}, nil, 'none')
    cookies[:auth] = {
      value: @token,
      httponly: true,
      expires: 1.year.from_now
    }
  end

  private

  def login_params
    params.require(:login).permit(:email)
  end

  def authorize_params
    params.require(:token)
  end
end
