class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password, uniqueness: true

  enum role: ["user", "admin"]

end
