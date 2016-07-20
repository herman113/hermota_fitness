class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  #before_save { self.username = username.downcase }
  validates :username, presence: true, 
            uniqueness: {case_sensitive: false},
            length: {minimum: 2, maximum: 20}
  HERMAN_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
            uniqueness: {case_sensitive: false},
            length: {maximum: 105},
            format: {with: HERMAN_REGEX}
  has_secure_password
end