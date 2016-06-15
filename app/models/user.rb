class User < ActiveRecord::Base
  validates :username, presence: true, 
            uniqueness: {case_sensitive: false},
            length: {minimum: 2, maximum: 20}
  HERMAN_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
            uniqueness: {case_sensitive: false},
            length: {maximum: 105},
            format: {with: HERMAN_REGEX}
end