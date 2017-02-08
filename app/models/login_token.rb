class LoginToken < ApplicationRecord
  def self.new_token
    SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')
  end
end
