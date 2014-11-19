class User < ActiveRecord::Base
  attr_accessor :name
  attr_accessor :email
  before_save { self.email = email.downcase , self.username = username.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:username,presence: true , length: { maximum: 19 }, uniqueness: true)
  validates(:email,presence: true,format: { with: VALID_EMAIL_REGEX }, uniqueness: true)
  has_secure_password #this adds a securely hashed 'password_digest' attribute to the database.
                      #It also adds a pair of virtual(existing on the model object but not on the db) attributes
                      # 'password' and 'password_confirmation' on the creation of the object and require that they both match.
                      # It also adds an 'authenticate' method that returns the specific User object when the password_digest is the set-up original password
                      # and returns 'false' otherwise. 'hashed password' and 'password digest' are often synonyms.
  validates(:password, length: {minimum: 6})
end
