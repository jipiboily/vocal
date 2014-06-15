class Opinionated::User < ActiveRecord::Base
  has_secure_password
  has_many :posts

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end