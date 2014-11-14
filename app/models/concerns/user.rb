class User < ActiveRecord::Base
  attr_accessor :name, :email
  before_save { self.email = email.downcase , self.name = name.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:name,presence: true , length: { maximum: 19 }, uniqueness: true)
  validates(:email,presence: true,format: { with: VALID_EMAIL_REGEX }, uniqueness: true)
end
