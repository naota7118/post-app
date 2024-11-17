class User < ApplicationRecord
  has_many :microposts
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
end
