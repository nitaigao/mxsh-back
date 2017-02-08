class Identity < ApplicationRecord
  belongs_to :user

  validates :email, presence: true, email: true, uniqueness: true
end
