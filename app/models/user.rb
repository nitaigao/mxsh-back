class User < ApplicationRecord
  has_many :identities

  validates :email, presence: true, email: true, uniqueness: true
end
