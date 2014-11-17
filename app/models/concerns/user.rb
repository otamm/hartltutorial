class User < ActiveRecord::Base
#  attr_accessor :name, :email
  before_save { self.email = email.downcase , self.username = username.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:username,presence: true , length: { maximum: 19 }, uniqueness: true)
  validates(:email,presence: true,format: { with: VALID_EMAIL_REGEX }, uniqueness: true)
end
