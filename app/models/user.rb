class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username

  has_secure_password
  validates :username, uniqueness: true, presence: true
end
