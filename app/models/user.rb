class User < ApplicationRecord
  has_secure_password
  has_many :band_users
  has_many :bands, through: :band_users
  has_many :shows
  has_many :venues, through: :shows
  validates_presence_of :username, :password, uniqueness: true

  enum role: ["user", "admin"]

end
