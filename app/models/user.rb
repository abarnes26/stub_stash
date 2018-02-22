class User < ApplicationRecord
  has_secure_password
  has_many :band_users
  has_many :bands, through: :band_users
  has_many :shows
  has_many :venues, through: :shows
  validates_presence_of :email, :password, uniqueness: true

  enum role: ["user", "admin"]

  def self.update_with_spotify_info(auth_hash = {})
    user = User.find_or_create_by(uid: "#{auth_hash['uid']}")

    user["username"] = auth_hash["info"]["nickname"]
    user["name"] = auth_hash["info"]["name"]
    user["uid"] = auth_hash["uid"]
    user["token"] = auth_hash["credentials"]["token"]

    user.save
    user
  end

end
